---
name: kill-keep-scale-workflow
version: 2.0.0
---

# 09 — Kill–Keep–Scale

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Quyết định phân bổ ngân sách dựa trên contribution thực tế, không chỉ platform ROAS.

## Trigger

Gate 8C của workflow 08 đạt: spend ≥ $100, hoặc chạm kill rule, hoặc có tín hiệu scale.

## Tools

- Shopify MCP: `run-analytics-query`, `list-orders` — revenue thật.
- `config/thresholds.yaml` — bộ rule quyết định.
- `templates/decision-record.md`.

## Input

Ads performance + Shopify revenue + contribution margin + refund rate + attribution confidence + operational readiness (supplier, cash flow, CS).

## Action

1. Kiểm tra yếu tố gây nhiễu (attribution lag, ngày lễ, tracking lỗi).
2. Tính contribution thực tế = revenue − landed cost − fees − ad spend.
3. Áp rule từ thresholds:
   - **KILL**: spend ≥ 5 × AOV mà 0 sale, HOẶC ROAS < 1.4 sau khi đủ dữ liệu.
   - **KEEP**: ROAS 1.4 – 1.6 → giữ budget, tiếp tục tối ưu creative/offer.
   - **SCALE**: ROAS ≥ 1.6 VÀ ≥ 5 purchases → đề xuất tăng budget +20%/lần, cách nhau ≥ 48h.
4. Nếu SCALE: kiểm tra supplier capacity, cash flow, CS, creative pipeline sẵn sàng chưa.
5. Tạo Decision Record + Budget Action Proposal → Human duyệt.

## Output

Decision Record + Budget Action Proposal + Scale Readiness Report + Next Review Date.

## Decision Gate

- Gate 9A: Quyết định dựa trên contribution thực tế (không chỉ platform ROAS)?
- Gate 9B: Đủ dữ liệu để tránh premature kill/scale (spend ≥ $100 hoặc chạm kill rule)?
- Gate 9C: Nếu scale — operations sẵn sàng?
- Gate 9D: Human phê duyệt hành động ngân sách?

## Definition of Done

- [ ] Decision rõ ràng kèm financial + funnel evidence và confidence.
- [ ] Human đã duyệt; action log + review date đã ghi.
- [ ] `pipeline-status.md` cập nhật trạng thái mới (killed / live / scaling).

## Handoff → 10 Post-Test Learning (bắt buộc sau mọi quyết định KILL; sau mỗi chu kỳ với KEEP/SCALE)
