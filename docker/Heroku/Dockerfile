FROM python:3.10-slim-bullseye

# --- ENV ---
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    DOCKER=true \
    GIT_PYTHON_REFRESH=quiet

# --- SYSTEM DEPS ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential curl ffmpeg gcc git libavcodec-dev libavdevice-dev \
    libavformat-dev libavutil-dev libcairo2 libmagic1 libswscale-dev \
    openssl openssh-server python3-dev gnupg \
    && rm -rf /var/lib/apt/lists/*

# Node.js (для Heroku нужен)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# --- APP SETUP ---
WORKDIR /data/Heroku

# Клонируем репо
RUN git clone https://github.com/coddrago/Heroku.git .

# Ставим зависимости
RUN pip install --no-warn-script-location --no-cache-dir -U -r requirements.txt

# Копируем скрипт входа
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python3", "-m", "heroku", "--root"]
