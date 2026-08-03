# Scoring Model (bản di động)

> Nếu chạy trong repo greenlight: `_index/scoring-model.md` của repo là single source of truth, thắng file này.

## 1. Fatal gates (auto-KILL, override mọi điểm)
| gate | trip khi | KHÔNG trip khi |
|---|---|---|
| `demand` | không có demand đo được, HOẶC trend chết hẳn không angle hồi sinh | trend giảm nhưng còn ngách/mùa vụ/angle mới |
| `legality` | counterfeit thật / banned / seizure-level, không sửa được bằng pivot | chỉ risky ad-policy (→ tier + routing) |
| `sourcing` | không thể source/ship bằng BẤT KỲ cách nào | ship chậm / giá cao / MOQ khó (→ điểm) |

## 2. 7 trục (1–5, max 35) — mỗi điểm cite nguồn
1. **Wow / demo-ability** — dừng scroll trong 3s? demo được cơ chế/kết quả?
2. **Demand & trajectory** — demand thật + rising > peak > flat > dying.
3. **Competitive gap** — còn khe (persona/dịp/geo/price/angle) hay red-ocean.
4. **Unit economics** — margin @ CPA × headroom. Rule: ≥2.5x → 4–5 · 2.0–2.5x → 3 · 1.5–2.0x → 2–3 nếu indicators tốt · <1.5x → cần headroom rõ mới >1. **`cogs_confidence: estimated` → CAP 3 điểm** + GO phải kèm điều kiện xác nhận báo giá.
5. **Buyer problem/desire intensity** — đau/khao khát mạnh, cấp thiết, dễ khơi bằng hook.
6. **Differentiation / defensibility** — khác biệt giữ được hay copy tức thì (sản phẩm giống hệt marketplace → thường ≤2–3, moat chỉ là angle/bundle).
7. **Backend / AOV** — bundle/upsell/subscription nâng AOV bù CPA.

## 3. Compliance tier (KHÔNG gate)
| tier | nghĩa | routing mặc định |
|---|---|---|
| `clear` | bán được với copy bình thường | `main` |
| `pivot_needed` | bán được NẾU đổi angle/copy/proof/sourcing — kèm smart_pivot bắt buộc | `main`/`isolated`; paid quá rủi ro giai đoạn đầu → `non_paid_first` |
| `blocked_legality` | phi pháp thật, không pivot được | → fatal `legality` |

## 4. Verdict
```
fatal_gate != none → KILL
28–35 GO (→ approved-pending-brief, chờ human duyệt)
22–27 REFINE (đổi angle/offer/nguồn → chấm lại)
16–21 REWORK (dựng lại concept)
≤15  KILL
```
REFINE/REWORK: ghi rõ cái gì cần đúng để lên hạng + loop từ bước nào + deadline nếu mùa vụ.
