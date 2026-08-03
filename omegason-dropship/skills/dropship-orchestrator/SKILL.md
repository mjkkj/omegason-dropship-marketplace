---
name: full-stack-dropshipping-marketing-orchestrator
version: 2.0.0
description: >
  Điều phối 10 workflow Full-Stack Dropshipping từ research đến learning.
  Kích hoạt khi user nói về pipeline sản phẩm, "sản phẩm này đang ở bước nào",
  "chạy bước tiếp theo cho pid-XXXX", "check pipeline", "launch sản phẩm mới",
  hoặc bất kỳ yêu cầu nào cần chuỗi nhiều bước dropshipping liên tiếp.
language: vi
execution_mode: human-in-the-loop
---

# Full-Stack Dropshipping Marketing Orchestrator

Điều phối workflow, kiểm tra Decision Gate, quản lý state và chuyển giao giữa các bước.
Đây là **lớp điều phối** — công việc chuyên môn được giao cho skill/tool chuyên trách (xem Tool Map).

> **Method vs State.** Skill này đóng gói *phương pháp* (workflows, templates, schemas, thresholds mặc định, knowledge khởi tạo). *Trạng thái sống* của từng dự án — `pipeline-status.md`, thư mục `products/pid-XXXX/`, và Notion (Dropship Pipeline + Human Tasks) — nằm trong **folder làm việc của mỗi người**, không nằm trong plugin. Khi chạy, ưu tiên đọc thresholds/knowledge của folder dự án nếu có; nếu chưa có thì dùng bản mặc định kèm skill này.
>
> Người duyệt cuối trong tài liệu này ghi là **Human** — thay bằng người duyệt thực tế của dự án.

## Thứ tự đọc mỗi phiên

1. `pipeline-status.md` — trạng thái toàn pipeline.
2. `config/thresholds.yaml` — ngưỡng quyết định hiện hành.
3. `_shared-rules.md` — quy tắc chung.
4. Workflow tương ứng với bước cần chạy.

## Routing: status → workflow

| Status của pid | Workflow cần chạy |
|---|---|
| (chưa có candidate) | 01 Product Research |
| `research` | 02 Product Validation |
| `validating` (đã advance) | 03 Supplier Validation |
| `sourcing` (supplier approved) | 04 Offer Development |
| `offer` (offer approved) | 05 Store Build + 06 Creative (song song) |
| `building` / `creative` | hoàn tất 05/06 còn thiếu |
| `ready-to-launch` | 07 Campaign Launch |
| `live` | 08 Daily Optimization (mỗi ngày) |
| `live` + Gate 8C đạt | 09 Kill–Keep–Scale |
| sau quyết định 09 (nhất là KILL) | 10 Post-Test Learning |

## Tool Map

| Workflow | Engine chính |
|---|---|
| 01 Research | skill `niche-hunter` + WinningHunter MCP |
| 02 Validation | skill `greenlight-run` |
| 03 Supplier | web search + `knowledge/supplier-history.md` |
| 04 Offer | templates + `brief_competitor` |
| 05 Store Build | skill `pid-to-store`, `product-pdp-image-builder` + Shopify MCP |
| 06 Creative | skill `hook-tester`, `dtc-infographic-generator` |
| 07 Launch | hook-tester framework (Human thao tác Ads Manager) |
| 08 Daily | Shopify MCP analytics + Ads data từ Human |
| 09 Kill–Keep–Scale | rules trong `config/thresholds.yaml` |
| 10 Learning | ghi vào `knowledge/` |

## Orchestration Rules

- Không bỏ qua Decision Gate; không chuyển bước khi chưa đạt Definition of Done.
- Thiếu dữ liệu → hỏi đúng phần thiếu hoặc dừng tại gate, không đoán.
- Mọi output dùng `templates/`; mọi record theo `schemas/`.
- Kết thúc mỗi bước: cập nhật `pipeline-status.md` + `products/pid-XXXX/record.yaml` + decision log.
- Hành động publish / launch / ngân sách / supplier / refund / pháp lý → luôn chờ Human duyệt.
