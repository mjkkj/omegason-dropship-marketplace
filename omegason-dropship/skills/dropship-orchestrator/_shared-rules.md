# Shared Rules — áp dụng cho TẤT CẢ workflows

Mỗi workflow chỉ chứa phần riêng của nó. Mọi quy tắc dưới đây mặc định áp dụng, không lặp lại trong từng file.

## Owner & Approval

- **Human Approver duy nhất: Human.** Mọi escalation đều về Human, kèm nhãn domain (Strategy / Finance / Operations / Legal) để Human biết loại rủi ro.
- Agent được phép: research, phân tích, tính toán, tạo draft, tạo recommendation, ghi record.
- Agent KHÔNG được tự thực hiện: publish store/page, launch/sửa campaign, thay đổi ngân sách, chốt supplier, refund, và mọi hành động pháp lý. Các hành động này tạo **Approval Request** chờ Human duyệt.

## Preconditions chung

- Input bắt buộc của workflow đã có; thiếu thì dừng và hỏi đúng phần thiếu.
- Sản phẩm có `pid` và thư mục `products/pid-XXXX-slug/` (xem `products/README.md`).
- Dữ liệu nguồn có ngày thu thập và link tham chiếu.
- Ngưỡng số lấy từ `config/thresholds.yaml` — không tự bịa số.

## Quy tắc kết luận

- Mọi kết luận phân biệt rõ: **Fact** (có nguồn), **Inference** (suy luận từ fact), **Recommendation** (đề xuất hành động).
- Không kết luận chung chung kiểu "sản phẩm tiềm năng" — phải kèm evidence và confidence (low/medium/high).

## Failure Conditions chung

Dừng workflow và báo Human khi: thiếu dữ liệu bắt buộc; dữ liệu mâu thuẫn chưa giải quyết; không xác minh được giả định trọng yếu; vượt ngưỡng rủi ro trong `config/thresholds.yaml`; hoặc Human từ chối tại Decision Gate.

## Handoff chung

Khi hoàn thành Definition of Done, cập nhật `pipeline-status.md` và `products/pid-XXXX/record.yaml` (status mới), kèm:

- Output package của workflow.
- Decision log (quyết định gì, ai duyệt, khi nào).
- Giả định chưa xác minh + risk flags còn mở.

## ID Convention

- Product: `pid-XXXX` (tương thích hệ Greenlight Engine — nếu sản phẩm đã có pid từ `greenlight-run`, dùng lại pid đó).
- Experiment: `exp-XXXX`, Creative: `cre-XXXX`, Campaign: `cmp-XXXX`, Supplier: `sup-XXXX`.
- Số tăng dần, không tái sử dụng ID cũ.
