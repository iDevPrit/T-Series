# Use an actively maintained image with Python 3.10 and Node.js 20
FROM nikolaik/python-nodejs:python3.10-nodejs20

# Set working directory
WORKDIR /app

# Install required system dependencies (ffmpeg for audio processing)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy all project files into the container
COPY . .

# Upgrade pip and install Python dependencies
RUN python3 -m pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

# Set environment variable to ensure UTF-8
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    LANG=C.UTF-8

# Start the bot (make sure you have a 'start' script or correct command)
CMD ["bash", "start"]

