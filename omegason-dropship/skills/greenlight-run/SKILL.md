---
name: greenlight-run
description: Chạy Greenlight Engine (pipeline 00→06) để đánh giá một sản phẩm dropship/DTC — ra verdict GO/REFINE/REWORK/KILL kèm bằng chứng, hồ sơ pid đầy đủ và đường-lên-hạng. Kích hoạt khi user nói "Greenlight" kèm URL sản phẩm, ad, tracker URL hay tên+mô tả; hoặc "chạy pid" kèm link, "đánh giá sản phẩm này", "có nên bán sản phẩm này không", "audit product candidate", hoặc đưa 1 link sản phẩm kèm ý định kinh doanh. Cũng dùng để RE-SCORE một pid có sẵn ("chấm lại pid-XXXX", "refine xong rồi, chạy lại"). Hoạt động tốt nhất với WinningHunter MCP + web search; tự fallback web-only nếu thiếu tool. Chạy tự động không hỏi từng bước; chỉ dừng ở fatal gate, thiếu input bắt buộc (hỏi đúng 1 câu), hoặc GO (chờ human duyệt).
---

# greenlight-run — Product Greenlight Pipeline

## 1. Mục tiêu cốt lõi

Nhận **một sản phẩm ứng viên** (URL sản phẩm / ad / tracker URL / tên+mô tả) → trả về trong MỘT lần chạy, không cần trao đổi lại:

1. **Verdict**: `GO / REFINE / REWORK / KILL` + tổng điểm /35 + 1 dòng lý do + trục yếu nhất.
2. **Hồ sơ pid** (folder `products/pid-XXXX-<slug>/`): 7 file `00`–`06` + `SUMMARY.md` (file đọc-trước) — mọi con số có nguồn + ngày.
3. Nếu REFINE/REWORK: **đường lên hạng** cụ thể (việc gì, trục nào tăng, deadline nếu có yếu tố mùa vụ).
4. Nếu GO: dừng ở stage `approved-pending-brief` chờ human duyệt (không tự viết brief).

Người dùng chỉ cần gửi input một lần. Mọi quyết định trung gian agent tự xử theo phương pháp §2.

## 2. Phương pháp đã chốt (không thương lượng)

1. **Early-exit**: check rẻ chạy trước; fatal gate trip → dừng ngay, KILL, không tốn compute các bước sau.
2. **Fatal gate CHỈ có 3** — thứ không thể tối ưu bằng tiền/thời gian: `demand` chết hẳn · `legality` phi pháp thật (counterfeit/banned/seizure) · `sourcing` không thể source/ship bằng bất kỳ cách nào. **Margin thấp và ad-policy risk KHÔNG BAO GIỜ là lý do kill** — chúng là điểm số + routing.
3. **Evidence-first**: mọi tín hiệu demand cần ≥2 nguồn độc lập; mọi số trong bảng phải có cột nguồn; điểm nào không trace được về dữ kiện thì không được ghi.
4. **COGS ước tính bị phạt**: `cogs_confidence: estimated` → trục Unit-economics tối đa 3 điểm; muốn gỡ cap phải có báo giá thật.
5. **Không tin store nguồn**: store đang bán sản phẩm KHÔNG được dùng làm bằng chứng demand (nó có thể là store rác — ảnh AI, copy trộn, review giả). Đo demand độc lập hoàn toàn.
6. **Mùa vụ ≠ dying, flat evergreen ≠ chết**: nhìn trend 5 năm để tách mùa vụ; nếu mùa vụ → ghi rõ cửa sổ còn lại và biến nó thành deadline thực thi.
7. **Verbatim là nguyên văn**: buyer language không được paraphrase; thiếu ngưỡng (<15 câu) thì dùng proxy nhưng PHẢI khai báo "⚠proxy" ngay đầu file.
8. **Two-pass scoring được phép**: pass 1 generic → nếu rơi REFINE mà đã thấy khe rõ → lock angle/persona/offer → pass 2, ghi cột Δ + lý do. Không cộng điểm ở trục mà angle mới không chạm tới.
9. **Compliance là lane-shifter, không phải cop**: chỉ rà 3 nhóm hard-risk (weapon / trademark-counterfeit / phi pháp); mọi rủi ro khác xử bằng claim-rewrite + account routing.

## 3. Input / Output contract

**Input**: `Greenlight: <URL | ad | tracker URL | tên+mô tả>` + optional `niche: <tag>`. Hoặc pid folder có sẵn để re-score.

**Output**: folder `products/pid-XXXX-<slug>/` (pid = số kế tiếp trong `_index/portfolio.md`, 4 chữ số, không tái sử dụng; slug = 2–5 từ tiếng Anh mô tả sản phẩm, không mô tả angle). Mỗi file mở đầu bằng YAML front-matter; các field then chốt:

```yaml
# SUMMARY.md / 06
verdict: GO | REFINE | REWORK | KILL   ·  score: 0-35  ·  fatal_gate: none|demand|legality|sourcing
compliance_tier: clear | pivot_needed | blocked_legality
account_routing: main | isolated | non_paid_first
cogs_confidence: quoted | estimated
stage: intake→demand→gap→econ→compliance→language→scored→approved-pending-brief→brief→live
```

Cuối run: cập nhật dòng pid trong `_index/portfolio.md` (nếu repo có) + trả về SUMMARY + verdict + 1 dòng lý do + trục yếu nhất.

## 4. Plan thực thi 00→06

Chi tiết đầy đủ từng bước (tiêu chí bằng chứng, định nghĩa-xong): `references/pipeline.md`. Tóm tắt điều khiển:

| # | Bước | Việc chính | Dừng sớm khi |
|---|------|-----------|--------------|
| 00 | Intake | pid + product card + **giả thuyết mua hàng** ([Buyer+Problem] mua [Product] vì [Wow], tin nhờ [Proof], chốt bởi [Offer] — buyer phải là persona cụ thể) + checklist cờ đỏ sớm | — |
| 01 | Demand | ≥2 nguồn độc lập → bảng nguồn/tín hiệu/đọc-ra có SỐ; demand_level + trajectory (rising/peak/flat/dying) + check mùa vụ 5 năm | `fatal: demand` |
| 02 | Gap | ≥3 đối thủ bóc đủ 6 field (quy mô/angle/offer-price/audience/tuổi ad/điểm yếu); saturation rubric; rà 5 loại khe; **khe mạnh nhất viết dạng testable 4 phần** | không dừng |
| 03 | Econ | bảng landed cost đủ dòng có nguồn; margin @ CPA (bội số); `cogs_confidence`; leading indicators CÓ NGƯỠNG SỐ; bản đồ headroom kèm ước lượng tác động | `fatal: sourcing` |
| 04 | Compliance | rà đúng 3 nhóm hard-risk (ghi cả "không thấy"); tier + routing; claims tránh/viết-lại NGUYÊN VĂN | `fatal: legality` |
| 05 | Language | ≥15 verbatim nguyên văn có tag nguồn (thiếu → ⚠proxy); cluster pain/desire/objection theo tần suất; ≥5 hook seed (pattern-interrupt + pain + lời hứa); 2–4 angle xếp hạng; ĐỐI CHIẾU với khe của 02 | chỉ chạy nếu chưa fatal |
| 06 | Scorecard | fatal check TRƯỚC → 7 trục 1–5 mỗi điểm cite file → verdict theo §5 → đường lên hạng + deadline mùa vụ nếu có | ra verdict |

## 5. Scoring & verdict (SSOT di động — nếu chạy trong repo greenlight, `_index/scoring-model.md` của repo thắng)

7 trục (1–5): Wow/demo-ability · Demand&trajectory · Competitive gap · Unit economics (margin × headroom, cap 3 nếu estimated) · Buyer problem intensity · Differentiation/defensibility · Backend/AOV.

```
fatal_gate != none → KILL (điểm cao không cứu được)
28–35 GO · 22–27 REFINE · 16–21 REWORK · ≤15 KILL
```

Margin rule-of-thumb: ≥2.5x mạnh (4–5) · 2.0–2.5x ổn (3) · 1.5–2.0x mỏng-cứu-được (2–3) · <1.5x cần headroom rõ mới >1. Chi tiết + compliance tier: `references/scoring-model.md`.

## 6. Tools & fallback

| Cần | Ưu tiên 1 | Fallback |
|---|---|---|
| Demand | WinningHunter: `search_facebook_ads` (đếm total, tuổi ad, active-ads-on-page, ad mới theo cửa sổ ngày), `find_winning_products`, `search_exploding_topics` | web search: Google Trends 12th+5năm, Amazon best-seller rank, TikTok |
| Competitor | WH: `brief_competitor`, `search_shops`, `search_facebook_ads` | web search roundup "best <category> 2026" + review editorial + Trustpilot |
| Giá nguồn | AliExpress/CJ/1688 listing | anchor ngược từ giá Amazon retail (COGS ≈ 30–40% retail) → BẮT BUỘC đánh dấu `estimated` |
| Buyer language | comment ad đối thủ (rẻ nhất), review Amazon 1–3 sao | blog/forum parent/hobbyist — đánh dấu ⚠proxy |

Kết quả WH quá lớn bị dump ra file JSON → dùng `scripts/wh_ads_digest.sh` để tổng hợp. Trang JS-rendered (AliExpress) fetch fail → đừng retry, chuyển anchor ngược + `estimated`.

## 7. Scripts

- `scripts/new_pid.sh <repo_root> <slug>` — cấp pid kế tiếp, copy template, điền pid+ngày. Không có template → tự tạo skeleton tối thiểu.
- `scripts/wh_ads_digest.sh <dump.json>` — digest 1 file dump của search_facebook_ads: total, distinct advertisers, ads còn active gần đây, phân bố năm launch, bảng mẫu 20 dòng.

## 8. Guardrails (đúc từ error library E001–E005)

- E001: đừng coi margin tĩnh là án tử — 1.4x + indicators tốt + headroom rõ = còn cửa.
- E002: đừng veto vì "có thể bị reject ads" — route + claim-control.
- E004: đừng cho GO trên COGS chưa có báo giá mà không cắm cờ — cap 3 + điều kiện.
- Đừng dồn điểm cứu sản phẩm mình thích; muốn điểm cao hơn → research tốt hơn.
- Đừng dùng tên brand/ảnh của store nguồn trong bất kỳ output nào (trademark + misrepresentation).
- Batch nhiều sản phẩm → chạy tuần tự, mỗi SP một pid.

## 9. Ví dụ chuẩn

`examples/pid-0009-run.md` — run thật end-to-end: input là 1 URL store rác (copy trộn, ảnh AI), output REFINE 25/35 với đường lên hạng + deadline mùa vụ. Đọc để thấy chuẩn chất lượng từng file và cách xử lý store nguồn không đáng tin, COGS estimated, verbatim thiếu ngưỡng.
