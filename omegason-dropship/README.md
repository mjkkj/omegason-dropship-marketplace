# omegason-dropship

Bộ đồ nghề dropship/DTC dùng chung của Omegason, đóng gói thành 1 plugin.

## Gồm gì

**Orchestrator** — `skills/dropship-orchestrator/`: điều phối 10 workflow (research → validation → supplier → offer → store → creative → launch → optimize → kill/keep/scale → learning), kèm workflows/, templates/, schemas/, config/thresholds.yaml mặc định và knowledge/ khởi tạo. Human-in-the-loop.

**Skill chuyên trách** (29 skill):
- Research & validate: niche-hunter, niche-product-hunter, greenlight-run, avatar-research, quick-market-research
- Store & content: brand-builder, pid-to-store, product-pdp-image-builder, dtc-infographic-generator, audit-to-des-html, clone-link-to-my-shopify, ads-landing-builder, ui-ux-pro-max
- Creative & test: hook-tester, marketing-campaign-plan, marketing-email-sequence
- Optimize & scale: store-intel, marketing-brand-review, marketing-performance-report, marketing-competitive-brief
- Tiện ích & xuất bản: schedule, morning, skill-creator, prompt-master, docx, pptx, xlsx, pdf

**Command**: `/greenlight <input>` — chạy nhanh đánh giá sản phẩm ứng viên.

## Lưu ý

- **Method vs State**: plugin chứa *phương pháp* (workflows/thresholds/templates mặc định). *Trạng thái sống* của từng dự án (pipeline-status, products/, Notion) nằm trong folder làm việc của mỗi người.
- **MCP**: nhiều skill cần MCP (Shopify, WinningHunter, Higgsfield, Notion, Klaviyo...). Mỗi người tự authorize ở claude.ai → Connectors; plugin không mang theo credential.
