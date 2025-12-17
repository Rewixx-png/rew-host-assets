FROM python:3.10-slim

ENV DOCKER=true \
    GIT_PYTHON_REFRESH=quiet \
    PIP_NO_CACHE_DIR=1

# Ставим системные зависимости
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl libcairo2 git ffmpeg \
    libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev \
    gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Ставим Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# --- APP SETUP ---
WORKDIR /Legacy

# Клонируем репо ВНУТРИ образа
RUN git clone https://github.com/Crayz310/Legacy.git .

# Ставим питонячие либы
RUN pip install --no-warn-script-location --no-cache-dir -r requirements.txt

# Создаем папку данных
RUN mkdir -p /data

# Копируем и настраиваем скрипт входа (для версионности)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python3", "-m", "legacy"]
