---
name: bigger-swings-writer
description: >
  Viết concept quảng cáo "cú xoay lớn" (bigger swings) — hook, angle, kịch bản & ad copy đầy đủ —
  đa dạng THẬT theo 4 cảm xúc (Human/Nostalgia/Savings/Social Proof) × persona, chống lazy iteration.
  Kích hoạt khi user nói "viết concept quảng cáo", "viết hook/script cho pid", "cần góc mới/đột phá",
  "bigger swings", "ad copy đa dạng", "kịch bản UGC/podcast/testimonial", hoặc muốn biến một concept
  brief từ creative-matrix-planner thành creative viết hoàn chỉnh. Dùng cho WF 06 Creative.
language: vi
execution_mode: human-in-the-loop
---

# bigger-swings-writer — Viết concept "cú xoay lớn"

Lớp viết của WF 06. Nhận concept brief (từ `creative-matrix-planner`) hoặc một persona+cảm xúc, rồi viết **creative hoàn chỉnh**: hook 3 giây, big idea, kịch bản theo định dạng, ad copy (primary text + headline + CTA). Mỗi concept là một **góc khác biệt về ý tưởng**, không phải biến thể cosmetic — vì Meta gộp mẫu tương đồng thành "một tệp dữ liệu duy nhất".

## Khi nào dùng
- Đã có ma trận/brief và cần viết ra creative thật.
- Cần nhiều góc concept khác nhau cho cùng một sản phẩm/persona.
- Muốn kịch bản theo định dạng cụ thể (UGC, podcast-style, demo, testimonial, street interview).

## Cần chuẩn bị
- **pid** + buyer-language (pains/desires/objections), personas (`avatar-research`), offer & claim đã duyệt.
- (Tốt nhất) Concept brief từ `creative-matrix-planner` để biết ô ma trận cần viết.
- `knowledge/creative-learning-library.md` (angle đã thắng/fail) + `knowledge/policy-guardrails.md` (claim).

## Nguyên tắc "bigger swing" (định nghĩa lazy vs swing)
- **Lazy iteration (CẤM):** đổi màu nền, đổi 1 câu, đổi thứ tự cảnh — cùng một ý tưởng.
- **Bigger swing (YÊU CẦU):** đổi *big idea / góc cảm xúc / nhân vật / bối cảnh / cơ chế thuyết phục*. Người xem phải cảm thấy đây là một quảng cáo khác hẳn.

## Quy trình

### Bước 1 — Chốt trục của concept
Xác định persona + cảm xúc chủ đạo (Human / Nostalgia / Savings / Social Proof) + định dạng (Static/UGC/Podcast/Demo/Unboxing/Testimonial/Street). Nếu có brief từ matrix-planner thì lấy thẳng.

### Bước 2 — Đào nguyên liệu cảm xúc
Rút từ buyer-language: nỗi đau thật, khao khát, phản đối. Với mỗi cảm xúc, chọn "insight" khác nhau để đảm bảo mỗi concept có gốc riêng.

### Bước 3 — Viết concept (mỗi concept đủ các phần)
- **Hook (3 giây đầu)** — 3–5 phương án hook khác nhau về cơ chế (câu hỏi / tuyên bố sốc / khoảnh khắc quan sát / before-after…).
- **Big idea** — một câu nói rõ góc độc nhất.
- **Kịch bản** theo định dạng — beat-by-beat (VD UGC: khoảnh khắc → vấn đề → khám phá → chứng minh → CTA).
- **Ad copy** — primary text, headline, CTA.
- **Hypothesis** — concept này test niềm tin gì của khách.

### Bước 4 — Kiểm tra đa dạng & tuân thủ
- So các concept với nhau: nếu 2 concept cùng big idea → đó là lazy iteration, viết lại.
- Đối chiếu mọi claim với `policy-guardrails.md`; nghi ngờ → nhãn Legal, chờ duyệt.
- Loại angle đã fail trong learning-library.

### Bước 5 — Bàn giao
- Xuất bộ concept đã viết; định tuyến sản xuất: video → Higgsfield `generate_video`; static/infographic → `dtc-infographic-generator` / `product-pdp-image-builder`; dựa mẫu đối thủ → `ad-clone-adapt`.
- Nạp vào `hook-tester` (mỗi concept/hook = 1 hypothesis). Cập nhật `creative-learning-library` sau test (WF 10).

## Output
- **Concept Pack** (.md): N concept, mỗi concept gồm trục (persona/cảm xúc/format) + 3–5 hook + big idea + kịch bản beat-by-beat + ad copy + hypothesis + trạng thái claim.

## Guardrails
- **Chống lazy iteration** là tiêu chí số 1 — mỗi concept phải khác *ý tưởng*, không chỉ khác bề mặt.
- **Không bịa claim** y tế/hiệu quả; chỉ dùng claim đã duyệt.
- Giữ đúng brand voice; nếu có `marketing:brand-review` thì soát voice trước khi bàn giao.
- Con người duyệt trước khi sản xuất/launch (cổng WF 06 → 07).
