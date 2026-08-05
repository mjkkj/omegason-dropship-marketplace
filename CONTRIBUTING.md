# Hướng dẫn đóng góp

Cảm ơn bạn đã góp phần làm giàu bộ đồ nghề chung của team! Có 3 kiểu đóng góp.

## 1. Thêm một skill mới

1. Copy mẫu `docs/skill-template/` vào `omegason-dropship/skills/<ten-skill>/`.
   - Tên skill: chữ thường, dùng gạch nối (`kebab-case`), rõ nghĩa. VD: `tiktok-hook-finder`.
2. Viết `SKILL.md` với YAML frontmatter bắt buộc:
   ```yaml
   ---
   name: ten-skill
   description: Mô tả NGẮN + rõ KHI NÀO kích hoạt (đây là thứ Claude dùng để chọn skill).
   ---
   ```
3. Nếu skill cần MCP, ghi rõ trong SKILL.md (VD: "cần Shopify MCP").
4. Chạy kiểm tra tại máy:
   ```bash
   python3 scripts/validate_plugin.py
   python3 scripts/generate_catalog.py   # cập nhật SKILLS.md
   ```
5. Mở Pull Request, điền checklist trong PR template.

## 2. Sửa skill / workflow có sẵn

- Sửa trực tiếp file liên quan trong `omegason-dropship/skills/...`.
- Nếu đổi ngưỡng số dùng chung: sửa `skills/dropship-orchestrator/config/thresholds.yaml` — **một nguồn duy nhất**.
- Bump `version` trong `omegason-dropship/.claude-plugin/plugin.json` khi thay đổi có ảnh hưởng.
- Ghi thay đổi vào `CHANGELOG.md` mục `[Unreleased]`.

## 3. Yêu cầu chỉnh sửa / báo lỗi / đề xuất

Không cần code — mở [Issue](../../issues/new/choose) và chọn đúng mẫu:
- **Đóng góp skill** (mô tả skill muốn có)
- **Yêu cầu chỉnh sửa**
- **Báo lỗi**
- **Đề xuất tính năng**

## Quy tắc chung

- **KHÔNG commit credential** (token, API key, `.env`). CI sẽ chặn; `.gitignore` đã loại `.env`.
- Mỗi PR làm **một việc**, mô tả rõ ràng, tiếng Việt hoặc tiếng Anh đều được.
- Skill nên đã **chạy thật ≥ 1 lần** trước khi gửi.
- Tôn trọng [Quy tắc ứng xử](CODE_OF_CONDUCT.md).

## Quy trình review

PR cần: (1) CI xanh, (2) ≥ 1 review approve từ maintainer. Maintainer hiện tại: @mjkkj.
