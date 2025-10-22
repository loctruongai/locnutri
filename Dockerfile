FROM node:20-bullseye

# System deps
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip curl && \
    pip3 install -U yt-dlp && \
    npm i -g n8n@latest tini && \
    rm -rf /var/lib/apt/lists/*

# Thư mục làm việc
WORKDIR /usr/local/lib/n8n

# Thư mục dữ liệu cho n8n và phân quyền
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Biến môi trường
ENV NODE_ENV=production \
    N8N_PORT=5678 \
    N8N_USER_FOLDER=/home/node/.n8n \
    GENERIC_TIMEZONE=Asia/Ho_Chi_Minh

# Expose
EXPOSE 5678

# Chạy dưới user không đặc quyền
USER node

# Entrypoint
ENTRYPOINT ["tini","--"]
CMD ["n8n"]
