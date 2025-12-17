FROM python:3.10-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=on \
    DOCKER=true \
    GIT_PYTHON_REFRESH=quiet

WORKDIR /app

# --- SYSTEM DEPS ---
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    curl git ca-certificates build-essential ffmpeg gcc \
    libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
    libcairo2 libmagic1 libswscale-dev openssl openssh-server python3-dev wkhtmltopdf

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# --- APP SETUP ---
# Клонируем твой репо
RUN git clone https://github.com/Rewixx-png/RewHeroku.git .

# Ставим зависимости
RUN pip install --no-warn-script-location -U -r requirements.txt

# Копируем скрипт входа
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python3", "-m", "heroku", "--root"]