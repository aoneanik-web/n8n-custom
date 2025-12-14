# Base OS + Node (REQUIRED by n8n)
FROM node:20-bookworm

# Install system tools
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

# Install Piper TTS (open-source)
RUN pip3 install --no-cache-dir piper-tts

# Install n8n (official)
RUN npm install -g n8n

# Prepare n8n data dir
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Run as non-root
USER node
WORKDIR /home/node

# n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
