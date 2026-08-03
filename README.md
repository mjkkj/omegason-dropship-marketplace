# Omegason Marketplace

Marketplace nội bộ của Omegason chứa plugin dùng chung cho team dropship/DTC.

## Cài nhanh

Trong phiên Claude (Cowork / Claude Code), mở Plugin Manager và trỏ tới repo này:

```
/plugin marketplace add <github-org>/<repo>
/plugin install omegason-dropship@omegason
```

Sau khi cài, gõ lại `/plugin` để cập nhật khi có bản mới.

## Nội dung

- `omegason-dropship/` — plugin chính: orchestrator 10 workflow + toàn bộ skill research/creative/store/optimize + tiện ích xuất bản.

## Phát hành bản mới

1. Sửa skill trong `omegason-dropship/skills/`.
2. Bump `version` trong `omegason-dropship/.claude-plugin/plugin.json`.
3. Commit & push. Team chạy lại `/plugin` để update.
