FROM node:20-bookworm

USER root

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

# 🔑 FIX: allow pip inside Debian 12 container
RUN pip3 install --no-cache-dir --break-system-packages piper-tts

RUN npm install -g n8n

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

USER node
WORKDIR /home/node

EXPOSE 5678
CMD ["n8n"]
