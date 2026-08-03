#!/usr/bin/env bash
# new_pid.sh <repo_root> <slug>  — cấp pid kế tiếp + tạo folder từ template.
# Ví dụ: ./new_pid.sh ~/Documents/dropship-greenlight collapsible-beach-rinse-bucket
set -euo pipefail
ROOT="${1:?usage: new_pid.sh <repo_root> <slug>}"
SLUG="${2:?usage: new_pid.sh <repo_root> <slug>}"
PROD="$ROOT/products"
TODAY="$(date +%F)"

# pid kế tiếp = max(pid hiện có) + 1
LAST=$(ls -d "$PROD"/pid-[0-9][0-9][0-9][0-9]-* 2>/dev/null | sed -E 's/.*pid-([0-9]{4}).*/\1/' | sort -n | tail -1)
NEXT=$(printf "pid-%04d" $((10#${LAST:-0} + 1)))
DIR="$PROD/$NEXT-$SLUG"
[ -e "$DIR" ] && { echo "ERROR: $DIR đã tồn tại" >&2; exit 1; }

if [ -d "$PROD/_TEMPLATE-pid" ]; then
  cp -r "$PROD/_TEMPLATE-pid" "$DIR"
else
  # Không có template → skeleton tối thiểu
  mkdir -p "$DIR"
  for f in 00-product 01-demand 02-competitor-gap 03-unit-economics 04-compliance-risk 05-buyer-language 06-scorecard SUMMARY; do
    printf -- "---\npid: pid-XXXX\nstage: intake\nupdated: %s\n---\n\n# %s\n" "$TODAY" "$f" > "$DIR/$f.md"
  done
fi

# Điền pid + ngày vào mọi file
find "$DIR" -name '*.md' -exec sed -i.bak -e "s/pid-XXXX/$NEXT/g" -e "s/^updated: .*/updated: $TODAY/" {} \; -exec rm -f {}.bak \;

echo "$NEXT → $DIR"
