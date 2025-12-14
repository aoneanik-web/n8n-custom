# 1. Use Debian-based Node image (has apt-get)
FROM node:18-bullseye

# 2. Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

# 3. Install open-source TTS (Piper)
RUN pip3 install --no-cache-dir piper-tts

# 4. Install n8n globally
RUN npm install -g n8n

# 5. Create n8n data directory
RUN mkdir -p /home/node/.n8n

# 6. Set permissions
RUN useradd -ms /bin/bash node
RUN chown -R node:node /home/node

# 7. Switch to node user
USER node

# 8. Set working directory
WORKDIR /home/node

# 9. Expose n8n port
EXPOSE 5678

# 10. Start n8n
CMD ["n8n"]
