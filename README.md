# LocNutri n8n on Render

- Base: Node 20 + n8n latest
- Tools: ffmpeg, yt-dlp
- Data folder: /home/node/.n8n

## Deploy
1) Push repo này lên GitHub.
2) Render → New Web Service → Runtime: Docker → chọn repo.
3) Ở Environment, thêm các biến giống `render.yaml` (nếu không dùng render.yaml).
4) Deploy.

## Login
- User: admin
- Pass: 2025@Locnutri  → đổi ngay trong Settings.

## Notes
- Render Docker yêu cầu app lắng nghe **PORT=10000**. Đã cấu hình `N8N_PORT=10000`.
- `N8N_PROTOCOL=https` + `WEBHOOK_URL` dùng https để tránh lỗi redirect/cookie.
- Dữ liệu lưu ở `/home/node/.n8n`. Không bị mất khi chỉ restart container.
