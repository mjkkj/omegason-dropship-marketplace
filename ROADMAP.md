# Roadmap

Danh sách tính năng dự kiến. Muốn thêm/đổi ưu tiên → mở issue "Đề xuất tính năng".

## Gần (quick wins)
- [ ] **GitHub Pages**: publish `docs/` làm trang giới thiệu (playbook HTML làm landing).
- [ ] **Nhãn & Project board**: hàng chờ cho skill mới / edit-request / bug.
- [ ] **Bảng "skill cần MCP nào"** tự sinh từ frontmatter, nhúng vào SKILLS.md.
- [ ] **Pre-commit hook** chặn commit credential trước khi lên CI.

## Trung hạn
- [ ] **Release tự động** + CHANGELOG (release-please), gắn version theo tag; đóng gói `.zip` mỗi release.
- [ ] **Eval/test skill** trong CI: dùng `skill-creator` chấm skill trước khi merge.
- [ ] **Command `/new-skill`**: scaffold nhanh một skill từ mẫu.
- [ ] **Song ngữ VI/EN** cho README + CONTRIBUTING khi mở cho cộng đồng ngoài.

## Dài hạn
- [ ] **Tách plugin theo domain** (research / creative / store / ops) để cài chọn lọc.
- [ ] **Telemetry ẩn danh** (opt-in): skill nào hay dùng, để ưu tiên cải tiến.
- [ ] **Marketplace nhiều plugin**: thêm plugin cho mảng khác ngoài dropship.
- [ ] **Bộ dữ liệu benchmark chung** (`knowledge/`) versioned, tách khỏi state riêng của dự án.
