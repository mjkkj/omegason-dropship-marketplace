## Nội dung PR

<!-- Mô tả ngắn: thêm/sửa gì -->

## Loại thay đổi
- [ ] Thêm skill mới
- [ ] Sửa skill/workflow có sẵn
- [ ] Tài liệu / CI / khác

## Checklist
- [ ] `python3 scripts/validate_plugin.py` chạy xanh
- [ ] Đã cập nhật `SKILLS.md` (`python3 scripts/generate_catalog.py`) nếu thêm/đổi skill
- [ ] Skill có `SKILL.md` với frontmatter `name` + `description`
- [ ] Không commit credential/token/.env
- [ ] Đã ghi vào `CHANGELOG.md` (mục Unreleased) nếu cần
- [ ] Bump `version` trong `plugin.json` nếu thay đổi có ảnh hưởng
