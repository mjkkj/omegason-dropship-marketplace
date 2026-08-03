---
name: product-research-workflow
version: 2.0.0
---

# 01 — Product Research

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Tìm cơ hội sản phẩm có tín hiệu nhu cầu thực và phù hợp năng lực vận hành.

## Trigger

- Pipeline không còn candidate ở trạng thái `research`/`validating`, HOẶC
- Chạy định kỳ hàng tuần, HOẶC Human yêu cầu trực tiếp.

## Tools

- Skill `niche-hunter` — tìm và xếp hạng ngách.
- WinningHunter MCP: `find_winning_products`, `search_facebook_ads`, `get_tiktok_trending_products`, `search_exploding_topics`, `daily_radar`.
- Web search cho tín hiệu bổ sung (marketplace, review, competitor).

## Input

Research brief (market, category, khoảng giá, prohibited categories) + learning cũ trong `knowledge/` và các pid đã test.

## Action

1. Chuẩn hóa research brief và giới hạn tìm kiếm.
2. Quét tín hiệu bằng tools ở trên (trend, ad library, TikTok, marketplace).
3. Tạo longlist 20–50 sản phẩm.
4. Loại nhanh: rủi ro IP, shipping, policy, hoặc margin ước tính < `min_gross_margin_pct` (60%).
5. Đối chiếu `knowledge/` — loại sản phẩm trùng test cũ đã KILL trừ khi có yếu tố mới.
6. Tạo shortlist 5–10 candidate, mỗi cái kèm evidence, nguồn, ngày, confidence.

## Output

Product Candidate Package (dùng `templates/product-candidate-template.md`) cho mỗi candidate + tạo `products/pid-XXXX/`.

## Decision Gate

- Gate 1A: Mỗi candidate có ≥ 2 demand signals độc lập?
- Gate 1B: Margin ước tính ≥ 60% (thresholds: `min_gross_margin_pct`)?
- Gate 1C: Không trùng learning KILL cũ (hoặc có lý do mới rõ ràng)?

## Definition of Done

- [ ] 5–10 candidate đạt cả 3 gate, mỗi cái có audience hypothesis, competitor, supplier sơ bộ.
- [ ] Không chọn sản phẩm chỉ vì đang viral.
- [ ] `pipeline-status.md` đã cập nhật.

## Handoff → 02 Product Validation
