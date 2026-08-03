---
name: offer-development-workflow
version: 2.0.0
---

# 04 — Offer Development

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Biến sản phẩm thành offer hấp dẫn, dễ hiểu trong vài giây và có lợi nhuận.

## Trigger

pid đạt Gate 3D (supplier được duyệt) từ workflow 03.

## Tools

- `templates/unit-economics-template.md`, `templates/offer-package-template.md`.
- `knowledge/buyer-language-library.md` — pain/desire/objection thật của khách.
- WinningHunter MCP: `brief_competitor` — xem offer đối thủ đang chạy.

## Input

Validated Product Package + Supplier Approval Package (landed cost thật) + competitor pricing + fees + refund estimate.

## Action

1. Xác định core promise và value proposition từ buyer language.
2. Xây price architecture: single / duo / bundle / best value.
3. Tính unit economics: contribution before ads, breakeven CPA, breakeven ROAS thực tế của pid này — so với `min_roas` (1.4) và `scale_roas` (1.6), nêu rõ chênh lệch nếu breakeven cao hơn.
4. Xây bonus, guarantee, shipping promise, risk reversal — chỉ promise thứ supplier SLA làm được.
5. Xây objection handling từ buyer language; kiểm tra claim với `knowledge/policy-guardrails.md`.
6. Chuẩn bị 2–3 offer options cho Human chọn.

## Output

Offer Package + Unit Economics Model + Pricing Matrix + Objection Library + Approved Claims → `products/pid-XXXX/`.

## Decision Gate

- Gate 4A: Margin sau mọi fee ≥ 60% (`min_gross_margin_pct`)?
- Gate 4B: Offer hiểu được trong vài giây (test bằng 1 câu tóm tắt)?
- Gate 4C: Shipping promise và guarantee thực thi được theo SLA supplier?
- Gate 4D: Human phê duyệt offer?

## Definition of Done

- [ ] Core promise được duyệt, pricing architecture đủ các bundle.
- [ ] Có breakeven CPA/ROAS thực tế ghi vào `record.yaml`.
- [ ] Claims đã đối chiếu policy-guardrails.

## Handoff → 05 Store Build (có thể chạy song song 06 Creative Production)
