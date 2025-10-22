FROM node:20-bullseye

# System deps
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip curl && \
    pip3 install -U yt-dlp && \
    npm i -g n8n@latest tini && \
    rm -rf /var/lib/apt/lists/*

# Workdir
WORKDIR /usr/local/lib/n8n

# Nơi lưu dữ liệu n8n và phân quyền
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node
ENV N8N_USER_FOLDER=/home/node/.n8n

# Port Render bắt buộc cho Docker
ENV N8N_PORT=10000
EXPOSE 10000

# Chạy bằng user thường
USER node

# Start
ENTRYPOINT ["tini","--"]
CMD ["n8n"]
