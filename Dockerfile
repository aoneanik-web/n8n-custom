# Start from official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install open-source TTS (Piper)
RUN pip3 install --no-cache-dir piper-tts

# Switch back to n8n user
USER node
