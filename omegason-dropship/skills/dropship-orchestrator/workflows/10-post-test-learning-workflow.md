---
name: post-test-learning-workflow
version: 2.0.0
---

# 10 — Post-Test Learning

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Biến kết quả test thành tri thức tái sử dụng — đây là bước tạo compound value của toàn hệ thống.

## Trigger

- Bắt buộc sau mọi quyết định KILL (workflow 09).
- Sau mỗi chu kỳ review với sản phẩm KEEP/SCALE.

## Tools

- `templates/learning-record.md`.
- 5 file trong `knowledge/` — nơi ghi learning (mỗi file có entry format riêng).

## Input

Original hypothesis + experiment record + campaign data + Shopify funnel + unit economics + customer feedback + decision log.

## Action

1. Khôi phục hypothesis gốc; tóm tắt expected vs actual.
2. Phân tích root cause (không dừng ở "creative kém" — kém ở angle, hook hay proof?).
3. Phân loại: validated learning / observation / unresolved issue.
4. Xác định reusable rule (đủ cụ thể để áp cho pid sau).
5. **Ghi vào knowledge base theo entry format:**
   - Angle/hook results → `knowledge/creative-learning-library.md`
   - Buyer quotes/objections mới → `knowledge/buyer-language-library.md`
   - CPM/CTR/CVR thực tế → `knowledge/internal-benchmarks.md`
   - Vấn đề supplier → `knowledge/supplier-history.md`
   - Policy issue → `knowledge/policy-guardrails.md`
6. Cập nhật `products/pid-XXXX/record.yaml` (status cuối, kết quả).
7. Đề xuất next test + đề xuất chỉnh thresholds/workflow nếu có bằng chứng.

## Output

Learning Record + Root Cause Analysis + Reusable Rules + Next-Test Plan + Knowledge Base Updates.

## Decision Gate

- Gate 10A: Đủ bằng chứng để kết luận (phân biệt fact/inference)?
- Gate 10B: Learning đủ cụ thể để tái sử dụng (có scope: audience/market/category)?
- Gate 10C: Có cần Human duyệt cập nhật rule/threshold không?

## Definition of Done

- [ ] Expected vs actual đã đối chiếu, có root cause.
- [ ] Knowledge base đã được ghi entry mới (ít nhất 1 file).
- [ ] Có next-test recommendation. Không dùng kết luận chung chung.

## Handoff → quay lại 01 (candidate mới) hoặc 06 (iterate creative cho pid đang KEEP)
