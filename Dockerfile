# ===== Base image =====
FROM node:18-bullseye

# ===== Cài đặt môi trường cần thiết =====
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip curl ca-certificates tzdata && \
    pip3 install --no-cache-dir yt-dlp && \
    npm install --global n8n && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ===== Thư mục ứng dụng và dữ liệu =====
# /usr/local/lib/n8n  → nơi chứa binary n8n
# /data               → map với Render Disk để lưu workflow, credentials
RUN mkdir -p /usr/local/lib/n8n /data/files && \
    ln -sf /data/files /files && \
    chown -R node:node /usr/local/lib/n8n /data

WORKDIR /usr/local/lib/n8n

# ===== Thiết lập môi trường runtime =====
ENV N8N_USER_FOLDER=/data \
    NODE_ENV=production \
    N8N_PORT=5678 \
    GENERIC_TIMEZONE=Asia/Ho_Chi_Minh

# ===== Expose port =====
EXPOSE 5678

# ===== Chạy bằng user 'node' để tăng bảo mật =====
USER node

# ===== Lệnh khởi động =====
CMD ["n8n", "start"]
