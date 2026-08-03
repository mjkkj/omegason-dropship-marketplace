---
name: daily-optimization-workflow
version: 2.0.0
---

# 08 — Daily Optimization

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Theo dõi campaign và store hàng ngày, phát hiện bất thường, chẩn đoán bottleneck.

## Trigger

**Mỗi ngày** khi có ≥ 1 pid ở trạng thái `live`. (Nên đặt scheduled task chạy mỗi sáng.)

## Tools

- Shopify MCP: `run-analytics-query`, `list-orders`, `get-inventory-levels`.
- Ads data: Human export/paste hoặc screenshot từ Ads Manager (chưa có MCP Meta Ads).
- `templates/daily-performance-brief.md`.

## Input

Ads data + Shopify data + unit economics của pid + supplier alerts + CS signals.

## Action

1. Kiểm tra data integrity (Ads vs Shopify khớp không) trước khi phân tích.
2. Đối chiếu spend, revenue, AOV, contribution thực tế.
3. **Check kill rule mỗi ngày: spend ≥ 5 × AOV mà 0 sale → đề xuất KILL ngay, chuyển workflow 09.**
4. Phân tích funnel CPM → CTR → CVR → contribution; chẩn đoán bottleneck theo tầng (Ads / Store / Offer / Tracking / Operations).
5. Phân loại Critical / High / Medium / Observe.
6. Ghi Daily Performance Brief; tách rõ hành động agent tự làm được vs cần Human duyệt.

## Output

Daily Performance Brief + Anomaly Log + Diagnosis + Approval Queue.

## Decision Gate

- Gate 8A: Dữ liệu đủ và đáng tin (Ads vs Shopify lệch < 20%)?
- Gate 8B: Bottleneck đã xác định được tầng?
- Gate 8C: Đã chạm điều kiện chuyển 09? (spend ≥ `decision_review_after_spend_usd` $100, HOẶC chạm kill rule, HOẶC ROAS ≥ 1.6 với ≥ 5 purchases)

## Definition of Done

- [ ] Data integrity checked; Ads–Shopify đối chiếu.
- [ ] Có diagnosis (không chỉ liệt kê số) + priority + action.
- [ ] Nếu Gate 8C đạt → kích hoạt workflow 09.

## Handoff → 09 Kill–Keep–Scale (khi Gate 8C đạt) hoặc lặp lại ngày hôm sau
