#!/usr/bin/env bash
# Update a Shopify product's body_html. Backs up the existing one first.
#
# Usage:
#   ./shopify_update_body_html.sh <store.myshopify.com> <shpat_token> <product-handle> <path/to/new.html>
#
# Requires: curl, jq

set -euo pipefail

STORE="${1:?store domain required (e.g. shop.myshopify.com)}"
TOKEN="${2:?Admin API token required (shpat_...)}"
HANDLE="${3:?product handle required}"
HTML_FILE="${4:?path to new HTML file required}"

if [[ ! "$TOKEN" =~ ^shpat_ ]]; then
  echo "WARN: token does not start with 'shpat_' — likely wrong credential. Aborting." >&2
  exit 2
fi
[[ -f "$HTML_FILE" ]] || { echo "HTML file not found: $HTML_FILE" >&2; exit 2; }

API="https://$STORE/admin/api/2025-01"
H_TOKEN=(-H "X-Shopify-Access-Token: $TOKEN")
H_JSON=(-H "Content-Type: application/json")

echo "[1/4] Looking up product by handle: $HANDLE"
PRODUCT_JSON=$(curl -fsS "${H_TOKEN[@]}" "$API/products.json?handle=$HANDLE")
PID=$(echo "$PRODUCT_JSON" | jq -r '.products[0].id // empty')
[[ -n "$PID" ]] || { echo "Product not found for handle: $HANDLE" >&2; exit 3; }
echo "    product id = $PID"

BACKUP_DIR="$(dirname "$HTML_FILE")/../backups"
mkdir -p "$BACKUP_DIR"
TS=$(date +%Y%m%d-%H%M%S)
BACKUP="$BACKUP_DIR/${STORE%%.*}_${HANDLE}_${TS}.html"
echo "[2/4] Backing up current body_html → $BACKUP"
echo "$PRODUCT_JSON" | jq -r '.products[0].body_html // ""' > "$BACKUP"

echo "[3/4] Updating body_html…"
PAYLOAD=$(jq -n --arg id "$PID" --rawfile body "$HTML_FILE" \
  '{product:{id:($id|tonumber), body_html:$body}}')
curl -fsS -X PUT "${H_TOKEN[@]}" "${H_JSON[@]}" \
  --data "$PAYLOAD" "$API/products/$PID.json" > /dev/null

echo "[4/4] Verifying…"
LEN=$(curl -fsS "${H_TOKEN[@]}" "$API/products/$PID.json" \
  | jq -r '.product.body_html | length')
echo "    new body_html length = $LEN chars"
echo "Done."
