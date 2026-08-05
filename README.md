# Omegason Dropship Marketplace

> Khung làm việc chung của team Omegason cho dropship/DTC trên Claude Cowork — đóng gói thành một Claude plugin dùng chung, đóng góp và cải tiến được.

[![Validate](https://github.com/mjkkj/omegason-dropship-marketplace/actions/workflows/validate.yml/badge.svg)](https://github.com/mjkkj/omegason-dropship-marketplace/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Đây là gì

Một **marketplace + plugin** cho Claude, gồm:

- **Orchestrator** điều phối 10 workflow: research → validation → supplier → offer → store → creative → launch → optimize → kill/keep/scale → learning (human-in-the-loop).
- **29 skill** chuyên trách: săn ngách, chấm sản phẩm, dựng PDP, làm creative, test hook, mổ đối thủ, xuất báo cáo…
- **Command** `/greenlight` để đánh giá nhanh một sản phẩm ứng viên.

Xem toàn bộ danh sách skill ở [`SKILLS.md`](SKILLS.md) (tự sinh). Sổ tay vận hành đầy đủ ở [`docs/`](docs/).

## Cài đặt

Trong phiên Claude (Cowork / Claude Code), mở Plugin Manager:

```
/plugin marketplace add mjkkj/omegason-dropship-marketplace
/plugin install omegason-dropship@omegason
```

Sau khi cài, gõ lại `/plugin` bất cứ lúc nào để cập nhật khi có bản mới.

> **MCP không đi kèm credential.** Nhiều skill cần MCP (Shopify, WinningHunter, Higgsfield, Notion, Klaviyo…). Mỗi người tự kết nối ở claude.ai → Connectors; plugin không mang theo token.

## Cấu trúc repo

```text
.
├── .claude-plugin/marketplace.json      # manifest marketplace
├── omegason-dropship/                    # plugin chính
│   ├── .claude-plugin/plugin.json        # manifest plugin
│   ├── commands/greenlight.md            # slash-command
│   └── skills/                           # 29 skill (mỗi folder có SKILL.md)
│       └── dropship-orchestrator/        # bộ điều phối + workflows/templates/config/knowledge
├── docs/                                 # playbook HTML + mẫu skill
├── scripts/                              # validate + sinh catalog
├── SKILLS.md                             # catalog (tự sinh)
└── .github/                              # issue/PR templates + CI
```

## Đóng góp

Ai cũng có thể **thêm skill**, **yêu cầu chỉnh sửa** hoặc **báo lỗi**:

- Thêm/sửa skill → đọc [CONTRIBUTING.md](CONTRIBUTING.md), copy mẫu ở `docs/skill-template/`, gửi Pull Request.
- Yêu cầu chỉnh sửa / báo lỗi / đề xuất tính năng → mở [Issue](https://github.com/mjkkj/omegason-dropship-marketplace/issues/new/choose).
- Trao đổi ý tưởng → [Discussions](https://github.com/mjkkj/omegason-dropship-marketplace/discussions).

## Roadmap

Các tính năng dự kiến ở [ROADMAP.md](ROADMAP.md). Muốn thêm gì cứ mở issue "Đề xuất tính năng".

## Giấy phép

[MIT](LICENSE) © 2026 Omegason.
