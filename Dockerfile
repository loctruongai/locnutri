# Dùng bản Debian đầy đủ
FROM n8nio/n8n:1.39.0-full

USER root

# Cài ffmpeg + yt-dlp
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install yt-dlp && \
    apt-get clean

USER node
