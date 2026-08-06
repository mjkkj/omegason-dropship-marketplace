# Gethookd MCP — tool tham chiếu nhanh

| Tool | Việc | Chi phí |
|---|---|---|
| `search_ads` | Tìm ad theo query/perf/format/geo; filter `performance_scores`, `run_time`, `ad_format` | Tính theo số kết quả |
| `get_ad` | Chi tiết 1 ad: copy, media[], primary_image_url, transcripts[] | Free |
| `transcribe_ad` | Kích hoạt Whisper cho video (async) → poll `get_ad` | Free |
| `search_brands` / `start_brand_spy` / `get_top_ads` | Tìm & theo dõi brand đối thủ, lấy mẫu đang thắng | spy: có phí |
| `save_ad_to_swipe_file` | Lưu ứng viên vào swipe file | Free |
| `create_clone_ad` | Sinh biến thể ảnh từ ad nguồn + product của mình (async) | Có phí (theo variations/model) |
| `get_clone_ad` | Poll kết quả clone; đọc prompts[].status/media/error | 1 credit/lần |

Higgsfield: `generate_video` (9:16), `virality_predictor` cho nhánh video.
