# Shopify deploy

Deploy the HTML block to a product's `body_html` via Admin API.

## Prerequisites

- Store domain (`<handle>.myshopify.com`)
- Admin API access token (`shpat_...`) with `write_products` scope
- Product handle (slug from PDP URL, e.g. `passionplay-intimate-set`)

## Token sanity check

Real Shopify Admin API tokens start with `shpat_`. If the token starts with something else (`atkn_`, `shpss_`, etc.), it's the wrong credential — stop and ask the user for the correct one.

## Procedure

Use `scripts/shopify_update_body_html.sh` — it:

1. Fetches the product by handle to get the numeric ID
2. Saves current `body_html` to `backups/<store>_<handle>_<timestamp>.html`
3. PUTs the new `body_html` from the local HTML file
4. Fetches again to verify the update landed

## Manual fallback

If script fails, run by hand:

```bash
TOKEN="shpat_xxx"
STORE="myshop.myshopify.com"
HANDLE="passionplay-intimate-set"

# 1. Get product ID
curl -s -H "X-Shopify-Access-Token: $TOKEN" \
  "https://$STORE/admin/api/2025-01/products.json?handle=$HANDLE"

# 2. Backup current body_html
curl -s -H "X-Shopify-Access-Token: $TOKEN" \
  "https://$STORE/admin/api/2025-01/products/$PRODUCT_ID.json" \
  | jq -r '.product.body_html' > backups/$STORE_$HANDLE_$(date +%s).html

# 3. Update
curl -s -X PUT \
  -H "X-Shopify-Access-Token: $TOKEN" \
  -H "Content-Type: application/json" \
  --data @<(jq -n --arg id "$PRODUCT_ID" --rawfile body "./new.html" \
    '{product:{id:($id|tonumber), body_html:$body}}') \
  "https://$STORE/admin/api/2025-01/products/$PRODUCT_ID.json"
```

## After deploy

- Open the live PDP in browser, verify the description renders inside the existing theme.
- Check mobile width (DevTools 390px).
- Remind the user to **revoke or uninstall the custom app** if they don't need the token long-term.
