#!/bin/bash
# fal.ai helpers (bash; uses only curl/grep/cut). The API key is read from a file, never passed on the command line.
#   export FAL_KEY_FILE=/path/to/scratchpad/.fal_key   # chmod 600, contains "id:secret"
#
#   fal.sh upload FILE CONTENT_TYPE            -> prints a public fal CDN URL
#   fal.sh price ENDPOINT_ID                   -> prints pricing JSON
#   fal.sh schema ENDPOINT_ID                  -> prints the OpenAPI input schema (truncated)
#   fal.sh run ENDPOINT_ID REQUEST.json OUT.json  -> queue submit, poll every 15s (max ~8 min), save result
#   fal.sh sync ENDPOINT_ID REQUEST.json OUT.json -> synchronous call (fast endpoints: image edit, frames)
set -u
KEY=$(cat "${FAL_KEY_FILE:?set FAL_KEY_FILE}")
H="Authorization: Key $KEY"

jget() { grep -o "\"$1\":\"[^\"]*\"" | head -1 | cut -d'"' -f4; }

case "${1:-}" in
  upload)
    f="$2"; ct="$3"; name=$(basename "$f")
    init=$(curl -s -X POST "https://rest.alpha.fal.ai/storage/upload/initiate?storage_type=fal-cdn-v3" \
      -H "$H" -H "Content-Type: application/json" -d "{\"content_type\":\"$ct\",\"file_name\":\"$name\"}")
    file_url=$(echo "$init" | jget file_url); up_url=$(echo "$init" | jget upload_url)
    code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: $ct" --data-binary @"$f" "$up_url")
    [ "$code" = "200" ] || { echo "upload failed ($code)" >&2; exit 1; }
    echo "$file_url" ;;
  price)
    curl -s -H "$H" "https://api.fal.ai/v1/models/pricing?endpoint_id=$2"; echo ;;
  schema)
    curl -s "https://fal.ai/api/openapi/queue/openapi.json?endpoint_id=$2" | head -c 8000; echo ;;
  run)
    ep="$2"; req="$3"; out="$4"
    sub=$(curl -s -X POST "https://queue.fal.run/$ep" -H "$H" -H "Content-Type: application/json" --data @"$req")
    rid=$(echo "$sub" | jget request_id); [ -n "$rid" ] || { echo "submit failed: $sub" >&2; exit 1; }
    # status/result live under the app path (first two segments, e.g. minimax/h3-max)
    app=$(echo "$ep" | cut -d/ -f1-2); base="https://queue.fal.run/$app/requests/$rid"
    echo "request_id $rid" >&2
    for i in $(seq 1 32); do
      st=$(curl -s -H "$H" "$base/status")
      echo "$st" | grep -qE '"status":"(COMPLETED|ERROR|FAILED)"' && break
      perl -e 'sleep 15'
    done
    curl -s -H "$H" "$base" > "$out"; head -c 400 "$out"; echo ;;
  sync)
    curl -s -X POST "https://fal.run/$2" -H "$H" -H "Content-Type: application/json" --data @"$3" > "$4"; head -c 400 "$4"; echo ;;
  *)
    sed -n '2,10p' "$0"; exit 1 ;;
esac
