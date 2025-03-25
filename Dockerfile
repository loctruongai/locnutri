FROM n8nio/n8n

# Cài thêm ffmpeg + yt-dlp để xử lý video và tải từ YouTube
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install yt-dlp && \
    apt-get clean

USER node
