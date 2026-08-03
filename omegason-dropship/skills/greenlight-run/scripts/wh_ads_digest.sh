#!/usr/bin/env bash
# wh_ads_digest.sh <dump.json> [active_since YYYY-MM] [new_since YYYY-MM]
# Digest file dump JSON của WinningHunter search_facebook_ads (khi kết quả quá lớn bị ghi ra file).
# Ra: total match, distinct advertisers, ads còn active gần đây, phân bố năm launch, bảng mẫu.
set -euo pipefail
F="${1:?usage: wh_ads_digest.sh <dump.json> [active_since] [new_since]}"
ACTIVE_SINCE="${2:-$(date -d '1 month ago' +%Y-%m 2>/dev/null || date -v-1m +%Y-%m)}"
NEW_SINCE="${3:-$(date -d '3 months ago' +%Y-%m 2>/dev/null || date -v-3m +%Y-%m)}"

echo "== TOTAL ads khớp filter =="; jq -r '.total' "$F"
echo "== Distinct advertisers (sample trang này) + số ad =="
jq -r '.data[].pageName' "$F" | sort | uniq -c | sort -rn
echo "== Ads còn ACTIVE (lastSeen >= $ACTIVE_SINCE) trong sample =="
jq -r --arg d "$ACTIVE_SINCE" '[.data[] | select(.lastSeen >= $d)] | length' "$F"
echo "== Ads MỚI (started >= $NEW_SINCE) trong sample =="
jq -r --arg d "$NEW_SINCE" '[.data[] | select(.started >= $d)] | length' "$F"
echo "== Phân bố năm launch =="
jq -r '.data[].started[0:4]' "$F" | sort | uniq -c
echo "== Mẫu: page | started | lastSeen | dup | activeAdsOnPage | price | domain | caption =="
jq -r '.data[] | [(.pageName//"-"), .started[0:10], (.lastSeen[0:10]//"-"), (.countActive//"-"|tostring), (.total_active_ads_on_page//"-"|tostring), (.shopify_productprice//"-"|tostring), ((.shopify_shopifydomain//.urlStore//"-")|tostring[0:35]), ((.caption//.copy//"-")|tostring[0:60])] | @tsv' "$F" | head -20

# Đọc-ra gợi ý:
# - total lớn + nhiều advertiser cùng active → demand thật.
# - Ad có started cách đây ≥6-12 tháng mà lastSeen gần đây → creative CÓ LỜI dài hạn (tín hiệu mạnh nhất).
# - Đếm ad started trong cửa sổ gần (query riêng với ad_created_from/to) → ad velocity / new entrants.
