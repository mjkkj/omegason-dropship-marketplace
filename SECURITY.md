# Chính sách bảo mật

## Báo lỗi bảo mật

Nếu phát hiện lỗ hổng hoặc **credential bị lộ** trong repo, đừng mở issue công khai. Liên hệ trực tiếp maintainer (@mjkkj) hoặc email ceo@omegason.co.

## Không commit bí mật

- Không đưa token, API key, `.env`, cookie, session vào repo.
- Nếu lỡ commit: **revoke ngay** token đó rồi tạo cái mới; xoá khỏi lịch sử git (`git filter-repo`) trước khi push tiếp.
- CI (`validate_plugin.py`) quét mẫu `ghp_*`, `sk-*`, `xox*-*` và sẽ fail nếu thấy.

## MCP & quyền

Plugin không mang theo credential. Mỗi người tự authorize MCP ở claude.ai → Connectors với quyền tối thiểu cần thiết.
