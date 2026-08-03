---
name: store-build-workflow
version: 2.0.0
---

# 05 — Store Build

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Xây product page chuyển đổi tốt, tracking đúng, test order thành công.

## Trigger

pid đạt Gate 4D (offer được duyệt) từ workflow 04.

## Tools

- Skill `pid-to-store` — dựng premium PDP từ pid folder (engine chính).
- Skill `product-pdp-image-builder` — bộ 9 ảnh gallery infographic.
- Skill `audit-to-des-html` — description HTML; `clone-link-to-my-shopify` nếu clone từ trang mẫu.
- Shopify MCP: `create-product`, `update-product`, `get-shop-info` — đẩy listing lên store.

## Input

Offer Package + product facts + media từ supplier + approved claims + buyer insights + shipping data.

## Action

1. Chạy `pid-to-store` để dựng PDP; dùng `product-pdp-image-builder` cho gallery.
2. Tạo product trên Shopify qua MCP: variant, price, bundle, shipping.
3. Cài tracking (pixel, purchase event, currency, value) và analytics.
4. QA theo `templates/store-qa-checklist.md`: mobile, speed, CTA, layout.
5. Soạn Approval Request publish cho Human; sau khi publish, Human đặt test order end-to-end.
6. Ghi page version và tracking evidence vào `products/pid-XXXX/`.

## Output

Launch-Ready Store Package + Store QA Checklist + Tracking QA Report + Test Order Evidence.

## Decision Gate

- Gate 5A: Test order thành công end-to-end?
- Gate 5B: Tracking đúng value, currency, product ID?
- Gate 5C: Product page message-match với offer đã duyệt?
- Gate 5D: Human phê duyệt publish?

## Definition of Done

- [ ] Product page hoàn chỉnh, variant/giá/bundle/shipping đúng.
- [ ] Mobile QA đạt, không còn lỗi Critical/High.
- [ ] Test order + tracking hoạt động.

## Handoff → 06 Creative Production (nếu chưa chạy song song) hoặc 07 Campaign Launch
