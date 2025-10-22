# LocNutri n8n Video Automation

Hệ thống n8n được tích hợp sẵn:
- FFmpeg: xử lý video, ghép voice
- yt-dlp: tải video và phụ đề từ YouTube

## Cách deploy lên Render.com

1. Fork repo này về tài khoản GitHub của bạn
2. Truy cập https://dashboard.render.com
3. Chọn “New Web Service”
4. Kết nối với repo `locnutri`
5. Render sẽ tự động deploy dịch vụ n8n kèm FFmpeg + yt-dlp

## Mặc định đăng nhập:
- Username: `admin`
- Password: `2025@Locnutri`

> Nên đổi lại mật khẩu sau khi cài đặt xong.

## Sau khi deploy xong:
- Truy cập n8n: `https://locnutri-n8n.onrender.com`
- Import các workflow xử lý video
