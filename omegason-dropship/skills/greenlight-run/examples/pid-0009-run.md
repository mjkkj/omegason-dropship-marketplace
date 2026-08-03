# Example run — pid-0009 Collapsible Beach Rinse Bucket (REFINE 25/35)

Run thật 2026-07-08. Input: `chạy pid https://orlaaco.com/products/shorespritz-bucket`. Minh hoạ chuẩn chất lượng từng bước + 4 tình huống xử lý mẫu: store nguồn rác · COGS estimated · verbatim thiếu ngưỡng · mùa vụ thành deadline.

## 00 Intake — xử lý store nguồn không đáng tin
Fetch page phát hiện: URL/meta là xô gấp ShoreSpritz $59.99 nhưng body trộn nguyên copy sản phẩm khác (snake gaiters) + 100% ảnh AI-gen (`ChatGPTImage...`).
→ Quyết định mẫu: (1) vẫn đánh giá SẢN PHẨM, tách khỏi store; (2) ghi cờ đỏ "store rác — không dùng làm bằng chứng demand"; (3) đổi đơn vị đánh giá từ "xô rời $59.99" → "kit xô + pump" vì xô rời không đứng được trước Amazon bán full kit rẻ hơn; (4) giả thuyết mua hàng chốt persona cụ thể: bố mẹ 28–45 đi biển với con nhỏ.

## 01 Demand — 3 nguồn độc lập, toàn số
| nguồn | tín hiệu | đọc-ra |
|---|---|---|
| WH search_facebook_ads "portable beach shower" | 1.428 ads khớp; Flextail 446 active ads, 1 ad chạy LIÊN TỤC 12 tháng; Ontap 77 active ads từ 2024 | ad sống 12 tháng = có lời dài hạn → demand thật |
| WH filter ad_created 05→07/2026 | 621 ads MỚI trong 10 tuần, 6+ advertiser mới giá $9.99–18.95 | đang giữa mùa nóng + báo trước đáy giá đông |
| Web (RinseKit/REI/editorial) | brand leader >500k units, Shark Tank, roundup 2026 vẫn ra | evergreen có nền, không phải fad |

→ `high` + `rising` (mùa vụ — ghi rõ cửa sổ còn ~8–10 tuần). Fatal: none. Kết quả WH quá lớn dump ra file → dùng `wh_ads_digest.sh`.

## 02 Gap — phủ đủ tầng thị trường mới thấy khe
6 tầng: RinseKit $119–450 (premium, không nói với mẹ bỉm) · Flextail $69 (camping-generic) · BeachBox $219 (own family NHƯNG giá chặn mass) · Ontap (angle generic) · Amazon commodity $25–45 (bán tính năng, không câu chuyện) · dropship mới $9.99–18.95 (đấu đáy giá).
→ Khe testable: "Đánh vào **bố mẹ đi biển với con nhỏ** bằng angle **'60 giây reset tại xe'** với offer **Family Rinse Kit bundle $49–59**, vì Amazon bán cùng đồ không kể chuyện, BeachBox own family ở $219, dropship chỉ biết giảm giá." Saturation high → trục 3 chỉ 3/5 dù khe rõ.

## 03 Econ — anchor ngược + cắm cờ estimated
AliExpress chặn JS → KHÔNG retry, anchor ngược từ Amazon retail $25–45 → landed est ~$26 (pump $9–12 + xô $3–4 + ship line pin $6–9 + phí ~$4.5). Bán $49.99 kit → margin 1.9x (mỏng). `cogs_confidence: estimated` → **cap trục 4 = 3**. Headroom high (bundle phụ kiện cost thấp → AOV $62–68 ≈ 2.3–2.5x blended; báo giá agent; US warehouse; price test $59.99). Leading indicators có ngưỡng: thumb-stop ≥30%, CTR ≥1.5%, CPC ≤$1, ATC ≥8%.

## 04 Compliance — clear nhưng vẫn có việc
3 nhóm hard-risk: đều "không thấy" (ghi rõ). Tier `clear`/`main`. Claim-hygiene nguyên văn: cấm "ShoreSpritz"/"RinseKit" (™ người khác), "hot shower" (không heater), "safe for babies"; cấm tái dùng ảnh AI store nguồn. Residual: đặt sample kiểm pump + IPX thật.

## 05 Language — thiếu ngưỡng thì khai báo
Chỉ gom được 10 verbatim (8 thật + 2 ⚠proxy) < ngưỡng 15 → KHAI BÁO ngay đầu file + ghi việc bổ sung (mỏ lớn nhất: comment ad Flextail/Ontap). Pain #1: "Sandy feet will follow you home and create havoc in the car, the house, the bathroom, and the washing machine." → 6 hook seeds trace về verbatim; angle #1 khớp khe 02 ✓.

## 06 Scorecard — điểm nào cũng có căn cứ
4 (wow demo cát-trôi) + 4 (demand cao nhưng mùa vụ) + 3 (khe thật, saturation high) + 3 (1.9x, CAP estimated) + 4 (pain hằng ngày, không phải identity pain) + 2 (sản phẩm y hệt Amazon — moat chỉ angle+bundle) + 4 (bundle AOV) = **25/35 REFINE**.
Đường lên hạng ĐO ĐƯỢC: báo giá thật (trục 4→4) + bundle khó-copy: logo in xô + túi đồ chơi riêng + insert card (trục 6→3) = 27; validate angle bằng test nhỏ → 28+ GO. **Deadline: refine ≤1 tuần vì mùa còn 8–10 tuần, trễ thì dời 2027 hoặc xoay angle camping/pet.**

## Checklist chất lượng output (đối chiếu khi chạy SP khác)
- [ ] Mọi số có nguồn + ngày; demand ≥2 nguồn độc lập, không dùng store nguồn.
- [ ] Khe viết được thành câu testable 4 phần.
- [ ] `cogs_confidence` set đúng; estimated → cap + điều kiện.
- [ ] Claims tránh/viết-lại ghi NGUYÊN VĂN.
- [ ] Verbatim thiếu → ⚠proxy khai báo, không im lặng.
- [ ] REFINE/REWORK có đường lên hạng đo được + deadline nếu mùa vụ.
- [ ] GO → dừng chờ human duyệt, không tự viết brief.
