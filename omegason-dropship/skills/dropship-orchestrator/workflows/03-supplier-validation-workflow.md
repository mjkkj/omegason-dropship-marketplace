---
name: supplier-validation-workflow
version: 2.0.0
---

# 03 — Supplier Validation

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Xác minh supplier cung cấp đúng sản phẩm, chất lượng, giá và SLA — chọn primary + backup.

## Trigger

pid đạt Gate 2D (Human duyệt advance) từ workflow 02.

## Tools

- Web search: AliExpress, CJdropshipping, 1688, Alibaba — profile, rating, order history.
- `knowledge/supplier-history.md` — supplier đã từng dùng.
- Đặt sample: Human thực hiện (agent chuẩn bị spec và câu hỏi cho supplier).

## Input

Validated Product Package + product spec + max landed cost (= giá bán mục tiêu × 40%, để giữ margin 60%) + max shipping time + yêu cầu packaging.

## Action

1. Tìm tối thiểu 3 supplier (nếu có thể), chuẩn hóa landed cost (product + shipping + fee).
2. Kiểm tra profile, rating, order history, communication; đối chiếu `supplier-history.md`.
3. Xác minh material, dimensions, variants, package contents, media thật.
4. Xác minh processing time, tracking, xử lý lost/damaged, return.
5. Lập `templates/supplier-comparison.md`; đề xuất primary + backup.
6. Soạn Approval Request đặt sample cho Human.

## Output

Supplier Approval Package + Supplier Comparison + spec sheet + SLA, lưu vào `products/pid-XXXX/`. Tạo `sup-XXXX` record.

## Decision Gate

- Gate 3A: Landed cost giữ được margin ≥ 60% ở giá bán mục tiêu?
- Gate 3B: Sample/thông số đạt chuẩn (hoặc conditional approval có điều kiện rõ)?
- Gate 3C: Shipping time và issue handling rõ ràng?
- Gate 3D: Human phê duyệt supplier?

## Definition of Done

- [ ] Có primary + backup supplier, landed cost xác nhận, variants đã map.
- [ ] Có SLA và cách xử lý lost/damaged.
- [ ] Cập nhật `knowledge/supplier-history.md`.

## Handoff → 04 Offer Development
