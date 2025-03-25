FROM n8nio/n8n

# Cài thêm ffmpeg và yt-dlp để xử lý video
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install yt-dlp && \
    apt-get clean

USER node
