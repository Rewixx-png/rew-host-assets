FROM python:3.10-slim-bullseye

ENV DOCKER=True \
    PYTHONUNBUFFERED=1

# --- SYSTEM DEPS ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential curl ffmpeg wget unzip \
    && rm -rf /var/lib/apt/lists/*

# --- APP SETUP ---
WORKDIR /Foxuserbot

# Клонируем репо (Замени URL на актуальный репо фокса, если он другой)
RUN git clone https://github.com/FoxUserbot/FoxUserbot.git .

# Ставим зависимости (без venv, глобально в контейнере)
RUN pip install --no-cache-dir -r requirements.txt || true

# Копируем скрипт входа
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
# Запускаем без venv
CMD ["python3", "main.py"]