# Dùng Debian base để có apt-get
FROM node:18-bullseye

# Tạo thư mục cho n8n
RUN mkdir -p /usr/local/lib/n8n

WORKDIR /usr/local/lib/n8n

# Cài các gói cần thiết
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip curl && \
    pip3 install yt-dlp && \
    npm install --global n8n && \
    apt-get clean

# Tạo thư mục dữ liệu
RUN mkdir /root/.n8n

# Expose port mặc định
EXPOSE 5678

# Lệnh chạy n8n
CMD ["n8n"]
