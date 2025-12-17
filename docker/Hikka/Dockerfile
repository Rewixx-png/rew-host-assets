FROM python:3.10-slim-bullseye as python-base

# --- ENV ---
ENV DOCKER=true \
    GIT_PYTHON_REFRESH=quiet \
    PIP_NO_CACHE_DIR=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# --- SYSTEM DEPS ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcairo2 git build-essential curl ffmpeg libavcodec-dev libavutil-dev \
    libavformat-dev libswscale-dev libavdevice-dev \
    && rm -rf /var/lib/apt/lists/*

# --- APP SETUP ---
WORKDIR /data/Hikka

# Клонируем репо (форк beveiled)
RUN git clone https://github.com/beveiled/hikka.git .

# Ставим зависимости
RUN pip install --no-warn-script-location --no-cache-dir -U -r requirements.txt

# Копируем скрипт входа
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python3", "-m", "hikka"]
