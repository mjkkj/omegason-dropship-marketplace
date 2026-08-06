---
name: creative-matrix-planner
description: >
  Từ một pid, dựng Ma trận Đa dạng Sáng tạo 4 trụ (Visual × Messaging × Persona × Format)
  và quota sản xuất theo bài toán volume/win-rate, rồi xuất một BATCH concept brief đa dạng
  thật (bigger swings, chống lazy iteration) sẵn sàng đẩy vào hook-tester / ad-clone-adapt / Higgsfield.
  Kích hoạt khi user nói "lên ma trận creative", "kế hoạch test creative cho pid",
  "cần bao nhiêu mẫu để đạt mục tiêu", "batch concept brief", "creative diversity plan",
  "sản xuất nội dung đa dạng", hoặc bắt đầu WF 06 Creative cho một sản phẩm.
language: vi
execution_mode: human-in-the-loop
---

# creative-matrix-planner — Ma trận đa dạng + quota sản xuất

Đầu vào của WF 06. Biến hiểu-biết khách hàng của một pid thành **một kế hoạch test có cấu trúc**: bao nhiêu mẫu, đa dạng theo trục nào, mỗi mẫu là một "cú xoay lớn" — cung cấp dữ liệu sạch cho máy học hậu Andromeda, nơi *nội dung là công cụ nhắm mục tiêu*.

## Khi nào dùng
- Bắt đầu sản xuất creative cho một pid (GO/REFINE).
- Cần chốt quota test/tuần theo mục tiêu doanh thu và win rate.
- Muốn tránh "lazy iteration" (đổi màu nền/chỉnh 1 câu) — Meta gộp các mẫu tương đồng thành "một tệp dữ liệu duy nhất".

## Cần chuẩn bị
- **pid** + hồ sơ: personas & buyer-language (`avatar-research`, `knowledge/buyer-language-library.md`), offer đã duyệt.
- `config/thresholds.yaml` — mục `creative` (diversity tối thiểu, day-1 kill) và `creative.win_rate_target_pct`. Nếu chưa có, dùng mặc định trong skill và ghi rõ giả định.
- `knowledge/creative-learning-library.md` — angle/hook đã thắng hoặc đã fail (tránh lặp fail).

## 4 trụ đa dạng (định nghĩa)
1. **Visual** — Static · UGC · Podcast-style · Video Demo · Unboxing · Testimonial · Street interview.
2. **Messaging (cảm xúc)** — Human (nhân văn) · Nostalgia (hoài niệm) · Savings (tiết kiệm) · Social Proof (bằng chứng xã hội).
3. **Persona** — vd Người bận rộn · Người tối giản · Mẹ bỉm sữa (lấy từ avatar-research của pid).
4. **Format/Placement** — Feed · Reels · Stories (đảm bảo phủ mọi vị trí).

## Quy trình

### Bước 1 — Nạp ngữ cảnh pid
Đọc personas, pains/desires/objections, offer, claim được phép. Liệt kê 3–4 persona rõ ràng; nếu thiếu → gọi `avatar-research` trước.

### Bước 2 — Tính quota (bài toán volume)
Từ mục tiêu doanh thu tháng (mặc định coi 1 mẫu thắng ≈ $1,000/ngày):
- `winners_needed = revenue_goal / 30000` (1 winner ≈ $30k/tháng).
- `tests_needed = ceil(winners_needed / win_rate)` với `win_rate` mặc định 10%.
- `weekly_quota = ceil(tests_needed / 4)`.
Nêu rõ con số + giả định. (VD $1M/tháng, WR 10% → ~35 winner → ~350 test.)

### Bước 3 — Dựng ma trận
- Sinh tổ hợp (Persona × Cảm xúc × Visual × Format) đủ **đạt diversity tối thiểu** trong thresholds (mặc định: ≥5 visual, ≥4 messaging, ≥3 persona, ≥3 format).
- Mỗi ô = một concept ĐỘC LẬP (bigger swing). Loại bỏ tổ hợp trùng góc đã fail trong learning-library.
- Cân đối để có đủ số concept ≥ `weekly_quota`.

### Bước 4 — Viết batch concept brief
Mỗi concept brief gồm: `concept_id` · persona · cảm xúc · visual · format · **hook (3 giây đầu)** · big idea · outline kịch bản · claim (đã đối chiếu policy) · nguồn cảm hứng (nếu từ `ad-clone-adapt`) · hypothesis (điều đang test).

### Bước 5 — Bàn giao & định tuyến
- Đẩy batch vào `hook-tester` (mỗi concept = 1 hypothesis trong matrix).
- Concept video → Higgsfield `generate_video`; concept static/infographic → `dtc-infographic-generator` / `product-pdp-image-builder`; concept dựa mẫu đối thủ → `ad-clone-adapt`.
- Ghi kế hoạch vào hồ sơ pid; cập nhật `creative-learning-library` sau khi có kết quả (WF 10).

## Output
- **Creative Matrix Plan** (.md): bảng quota + bảng ma trận (đánh dấu độ phủ 4 trụ) + N concept brief đầy đủ + bản đồ định tuyến sang skill sản xuất.

## Guardrails
- **Không lazy iteration.** Mỗi concept phải khác biệt thị giác/góc độ thật, không phải biến thể cosmetic.
- **Diversity là bắt buộc**, không phải tuỳ chọn — thiếu trục nào phải nêu và bổ sung.
- **Claim = cổng pháp lý**: chỉ dùng claim đã duyệt; nghi ngờ → nhãn Legal, chờ người duyệt.
- Con người duyệt kế hoạch trước khi sản xuất hàng loạt (cổng WF 06).
- Tách Fact / Inference / Recommendation trong mọi giả thuyết.
