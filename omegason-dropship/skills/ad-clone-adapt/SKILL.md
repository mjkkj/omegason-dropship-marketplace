---
name: ad-clone-adapt
description: >
  Bắt một quảng cáo ĐANG THẮNG của đối thủ, giải mã nó, rồi ADAPT (không copy) thành
  creative cho brand/sản phẩm của mình theo triết lý "Replicate & Adapt" hậu Andromeda.
  Kích hoạt khi user nói "clone ad này", "adapt mẫu thắng của đối thủ", "replicate ad",
  "mô phỏng quảng cáo", "làm creative giống ad X nhưng cho sản phẩm mình", "brief từ ad đối thủ",
  hoặc đưa link/ID một ad và muốn dựng phiên bản của brand mình. Dùng cho WF 06 Creative.
language: vi
execution_mode: human-in-the-loop
---

# ad-clone-adapt — Replicate & Adapt mẫu thắng

Biến một quảng cáo thắng của đối thủ thành creative của brand mình trong ~15 phút thay vì hàng tuần.
**Không sao chép nguyên bản** — giải mã *cấu trúc thắng* (hook, angle, nhịp, cảm xúc, offer) rồi tái tạo bằng sản phẩm, claim và persona của mình. Đây là một "cú xoay" đầu vào cho ma trận test của `hook-tester`, không phải lazy iteration.

## Khi nào dùng
- Có một mẫu đối thủ đang scale/winning và muốn có phiên bản của mình.
- Cần nạp nhanh nhiều concept đa dạng cho WF 06 mà vẫn dựa trên bằng chứng thị trường.
- Muốn theo dõi (spy) một brand đối thủ để bắt mẫu thắng mới liên tục.

## Cần chuẩn bị
- **MCP Gethookd** (creative-intel): search/scan/clone ads, brand spy. Cần scope `clone-ads:write`, `swipe-file:write`, `brand-spy:write` cho các bước ghi.
- **Higgsfield MCP** (tuỳ chọn): dựng video 9:16 khi mẫu nguồn là video.
- **pid** của sản phẩm đích + `product_id` trong Gethookd (để clone-ad gắn đúng sản phẩm).
- `knowledge/policy-guardrails.md` (claim được phép) + `knowledge/creative-learning-library.md`.
- Ngưỡng creative trong `config/thresholds.yaml` (day-1 kill, diversity tối thiểu) nếu đã thêm.

## Quy trình

### Bước 1 — Tìm mẫu nguồn (winner)
- Theo từ khoá/ngách: `search_ads(query, performance_scores="optimized,winning", ad_format, geo, language, run_time>=N)`. Ưu tiên `run_time` cao (đã chạy lâu = đã được validate) và `performance_scores` cao.
- Theo đối thủ cụ thể: `search_brands` → `start_brand_spy(brand_id)` → `get_top_ads(brand_id)` lấy mẫu đang chạy tốt nhất.
- Lưu ứng viên: `save_ad_to_swipe_file(ad_id)`.

### Bước 2 — Kéo chi tiết & transcript
- `get_ad(ad_id)` → lấy copy, `media[]` (chọn `media_id` ảnh để clone), `primary_image_url`.
- Nếu là video: `transcribe_ad(ad_id)` (async, free) → poll lại `get_ad(ad_id)` tới khi `transcripts[]` có nội dung.

### Bước 3 — Giải mã cấu trúc thắng (deconstruct)
Tách rõ, ghi thành bảng: **Hook** (3 giây đầu) · **Angle/Big idea** · **Cảm xúc** (Human / Nostalgia / Savings / Social Proof) · **Cấu trúc kịch bản** (problem→agitate→solution→proof→CTA…) · **Định dạng/visual** (UGC, demo, podcast, testimonial…) · **Offer & CTA** · **Vì sao mẫu này thắng** (giả thuyết).

### Bước 4 — Adapt sang brand mình (KHÔNG copy)
- Viết lại copy & hook bằng buyer-language của sản phẩm mình; giữ *cấu trúc*, đổi *nội dung*.
- Thay mọi claim bằng claim đã được duyệt trong `policy-guardrails.md`. **Không bê nguyên claim/thương hiệu/khuôn mặt của đối thủ.**
- Map sang ≥1 persona của mình (bận rộn / tối giản / mẹ bỉm…) để tạo biến thể "bigger swing", không phải đổi màu nền.

### Bước 5 — Sản xuất
- **Ảnh/static:** `create_clone_ad(ad_id, media_id, product_id, variations_count=3, aspect_ratio, model_slug)` → poll `get_clone_ad(clone_ad_id)` tới khi `prompts[].status = completed`. Nếu `failed`, đọc `error`/`failed_at`, không refund.
- **Video:** đưa kịch bản đã adapt sang Higgsfield `generate_video` (9:16), có thể `virality_predictor` để chấm trước.

### Bước 6 — QA & bàn giao
- Đối chiếu claim với `policy-guardrails.md`; gắn nhãn Fact / Inference / Recommendation cho mọi tuyên bố.
- Ghi mẫu nguồn + giả thuyết + biến thể vào `knowledge/creative-learning-library.md`.
- Nạp các biến thể vào ma trận `hook-tester` (mỗi biến thể = 1 hypothesis). Test theo Day-1 kill rule.

## Output
- **Clone Brief** (.md): bảng deconstruct + bảng biến thể (persona × cảm xúc × format) + link asset đã sinh + trạng thái claim.
- Asset ảnh/video đã tạo; ứng viên đã lưu swipe file.

## Guardrails
- **Adapt, đừng đạo.** Sao chép nguyên xi tài sản/khuôn mặt/thương hiệu đối thủ là rủi ro pháp lý và bị Meta xử lý như "một tệp dữ liệu duy nhất" → dễ bão hoà. Luôn tạo khác biệt thị giác thật.
- **Claim là cổng pháp lý.** Không tự chế tuyên bố y tế/hiệu quả; mọi claim phải có trong policy-guardrails hoặc chờ người duyệt (nhãn Legal).
- **Con người duyệt** trước khi đưa vào campaign (theo cổng WF 06 → 07).
- Tôn trọng chi phí credit: `create_clone_ad`/`get_clone_ad`/`start_brand_spy` có tính phí; `search_ads` tính phí theo số kết quả; `get_ad`/`transcribe_ad` free.
