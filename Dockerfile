# Dùng image n8n phiên bản Debian-based (có apt-get)
FROM n8nio/n8n:1.39.0-debian

USER root

# Cài ffmpeg và yt-dlp
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install yt-dlp && \
    apt-get clean

USER node
