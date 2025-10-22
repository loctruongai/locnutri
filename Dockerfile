# ---- Base image ----
FROM node:20-bullseye

# ---- Install dependencies ----
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip curl && \
    pip3 install -U yt-dlp && \
    npm install -g n8n@latest tini && \
    rm -rf /var/lib/apt/lists/*

# ---- Setup workdir ----
WORKDIR /usr/local/lib/n8n

# ---- Environment ----
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=Asia/Ho_Chi_Minh

# ---- Expose port ----
EXPOSE 5678

# ---- Entrypoint ----
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
