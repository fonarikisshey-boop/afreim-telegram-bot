FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY telegram_bot/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot code
COPY telegram_bot/ .

# Environment variables
ENV BOT_TOKEN=8625296525:AAGpvAUNIQvZRP1ZwaS5JNPOQyibziFRg6s
ENV WEBAPP_URL=https://afreim-calendar.onrender.com

# Run bot
CMD ["python3", "bot.py"]
