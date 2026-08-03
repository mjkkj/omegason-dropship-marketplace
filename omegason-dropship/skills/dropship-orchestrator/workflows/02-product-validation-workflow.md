---
name: product-validation-workflow
version: 2.0.0
---

# 02 — Product Validation

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Xác định sản phẩm có đáng đầu tư thêm nguồn lực không: advance / watchlist / reject.

## Trigger

- Có Product Candidate Package từ workflow 01, HOẶC
- Human đưa trực tiếp 1 link sản phẩm/ad kèm ý định kinh doanh.

## Tools

- **Skill `greenlight-run` là engine chính** của workflow này — chạy pipeline 00→06, ra verdict GO/REFINE/REWORK/KILL và hồ sơ pid. Workflow này không lặp lại logic đó, chỉ bọc thêm gate kinh tế bên dưới.
- WinningHunter MCP + web search (greenlight tự dùng).

## Input

Product Candidate Package (hoặc link + mô tả) + `knowledge/internal-benchmarks.md`.

## Action

1. Chạy `greenlight-run` cho candidate → nhận verdict + pid folder.
2. Bổ sung kiểm tra kinh tế: giá bán dự kiến, landed cost sơ bộ, margin.
3. Đối chiếu scorecard (`templates/validation-scorecard.md`) nếu cần chấm tay.
4. Ghi recommendation: advance / watchlist / reject / need_more_data.

## Output

Validated Product Package + verdict + scorecard, lưu vào `products/pid-XXXX/`.

## Decision Gate

- Gate 2A: Verdict greenlight = GO (hoặc REFINE đã xử lý xong)?
- Gate 2B: Margin sơ bộ ≥ 60% (`min_gross_margin_pct`)?
- Gate 2C: Có ≥ 3 customer insights và ≥ 3 creative angles khả thi?
- Gate 2D: Human phê duyệt advance?

## Definition of Done

- [ ] Có verdict + scorecard + economics sơ bộ + risk assessment.
- [ ] Có recommendation kèm confidence.
- [ ] Human đã duyệt trước khi sang 03.

## Handoff → 03 Supplier Validation
