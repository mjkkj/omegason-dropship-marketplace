---
name: campaign-launch-workflow
version: 2.0.0
---

# 07 — Campaign Launch

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Launch campaign có cấu trúc, tracking đúng và stop-loss rõ ngay từ đầu.

## Trigger

pid có đủ Launch-Ready Store Package (Gate 5D) + Creative Test Package (Gate 6C), và Human sẵn sàng cấp budget.

## Tools

- Framework từ `hook-tester` (campaign structure, kill/scale rules).
- Meta Ads Manager: Human thao tác — agent chuẩn bị toàn bộ cấu hình dạng checklist copy-paste.
- Shopify MCP: `run-analytics-query`, `list-orders` — xác nhận baseline trước launch.

## Input

Store Package + Creative Package + breakeven CPA/ROAS của pid + attribution setting.

## Action

1. Xác định test objective và primary variable (từ hook-tester framework).
2. Xây campaign/ad set/ad structure + naming convention + UTM.
3. Kiểm tra URL, pixel, purchase event, currency, value.
4. Đặt budget = `default_test_budget_usd` ($500) trừ khi Human chỉ định khác.
5. Đặt stop-loss theo kill rule: **KILL khi spend ≥ 5 × AOV mà chưa có sale** (`kill_spend_aov_multiplier`).
6. Tạo campaign draft/checklist → Human duyệt và bấm launch.
7. Ghi Experiment Launch Record (`exp-XXXX`, `cmp-XXXX`).

## Output

Experiment Launch Record + Campaign/Creative/UTM Mapping + Stop-Loss Rules → `products/pid-XXXX/`.

## Decision Gate

- Gate 7A: Tracking chính xác (verify bằng test event)?
- Gate 7B: Campaign structure trả lời được hypothesis?
- Gate 7C: Budget ($500 mặc định) và stop-loss (5×AOV) đã được Human duyệt?
- Gate 7D: Human xác nhận launch?

## Definition of Done

- [ ] Campaign live, budget/URL/tracking đúng.
- [ ] Experiment ID đã tạo, có review time và stop-loss ghi rõ.
- [ ] `pipeline-status.md` chuyển pid sang `live`.

## Handoff → 08 Daily Optimization (bật chế độ theo dõi hàng ngày)
