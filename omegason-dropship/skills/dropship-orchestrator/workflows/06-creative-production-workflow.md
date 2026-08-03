---
name: creative-production-workflow
version: 2.0.0
---

# 06 — Creative Production

> Quy tắc chung: `../_shared-rules.md` · Ngưỡng số: `../config/thresholds.yaml`

## Objective

Sản xuất bộ creative đa dạng để test giả thuyết khách hàng theo phương pháp Angle-First.

## Trigger

pid đạt Gate 4D (offer duyệt) — chạy song song với 05, hoặc ngay sau 05.

## Tools

- **Skill `hook-tester`** — xây hook library + testing framework (engine chính cho matrix và hypothesis).
- Skill `dtc-infographic-generator` — ảnh static/infographic ads.
- WinningHunter MCP: `creative_inspiration_pack`, `get_ad_transcript`, `save_ad` — tham khảo creative đối thủ.
- `knowledge/creative-learning-library.md` — angle/hook đã validate hoặc đã fail.

## Input

Offer Package + buyer language + audience hypotheses + approved claims + competitor references + sample footage (nếu có).

## Action

1. Chạy `hook-tester` để xây Creative Matrix (audience × awareness × angle × hook × format) — ưu tiên angle chưa fail trong learning library.
2. Chọn 1 biến chính cần test (angle-first isolation).
3. Tạo Creative Brief (`templates/creative-brief-template.md`) cho từng asset.
4. Sản xuất video / image / carousel / UGC; xuất đúng ratio và placement.
5. Creative QA + Policy Preflight (`knowledge/policy-guardrails.md`).
6. Gắn `cre-XXXX`, naming convention và metadata.

## Output

Creative Test Package + Creative Records + Briefs + QA Report → `products/pid-XXXX/`.

## Decision Gate

- Gate 6A: Mỗi creative có hypothesis rõ (test biến gì)?
- Gate 6B: Qua QA + policy preflight?
- Gate 6C: Human phê duyệt bộ creative?

## Definition of Done

- [ ] Tối thiểu 3 angles; 3–5 hooks cho angle ưu tiên; nhiều format.
- [ ] Mỗi asset có ID + metadata; tất cả qua QA, policy và Human duyệt.

## Handoff → 07 Campaign Launch
