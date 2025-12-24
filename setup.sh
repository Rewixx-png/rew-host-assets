#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}❌ Пожалуйста, запустите этот скрипт от имени root (sudo).${NC}"
  exit 1
fi

clear
echo -e "${CYAN}"
echo "██████╗ ███████╗██╗    ██╗██╗  ██╗ ██████╗ ███████╗████████╗"
echo "██╔══██╗██╔════╝██║    ██║██║  ██║██╔═══██╗██╔════╝╚══██╔══╝"
echo "██████╔╝█████╗  ██║ █╗ ██║███████║██║   ██║███████╗   ██║   "
echo "██╔══██╗██╔══╝  ██║███╗██║██╔══██║██║   ██║╚════██║   ██║   "
echo "██║  ██║███████╗╚███╔███╔╝██║  ██║╚██████╔╝███████║   ██║   "
echo "╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   "
echo -e "${NC}"
echo -e "${BLUE}>>> Интерактивный установщик v4.1${NC}"
echo ""

generate_secret() {
    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
}

ask_value() {
    local prompt="$1"
    local var_name="$2"
    local default="$3"

    if [ -n "$default" ]; then
        read -p "$(echo -e $YELLOW"$prompt [$default]: "$NC)" input
        if [ -z "$input" ]; then
            eval $var_name="$default"
        else
            eval $var_name="$input"
        fi
    else
        while true; do
            read -p "$(echo -e $YELLOW"$prompt: "$NC)" input
            if [ -n "$input" ]; then
                eval $var_name="$input"
                break
            else
                echo -e "${RED}Это поле обязательно!${NC}"
            fi
        done
    fi
}

echo -ne "${CYAN}🔍 Определение рабочей директории...${NC} "
if [ -f "./bot.py" ]; then
    PROJECT_DIR=$(pwd)
else
    PROJECT_DIR="/root/Bots/RewHost"
    mkdir -p "$PROJECT_DIR"
fi
echo -e "${GREEN}[$PROJECT_DIR]${NC}"
cd "$PROJECT_DIR"

echo -e "${CYAN}📦 Обновление системы и установка зависимостей...${NC}"
apt update -y
apt install -y python3 python3-pip python3-dev git curl nodejs npm postgresql-client build-essential libpq-dev

if ! command -v docker &> /dev/null; then
    echo -e "${CYAN}🐳 Установка Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
fi

if ! command -v pm2 &> /dev/null; then
    echo -e "${CYAN}🔄 Установка PM2...${NC}"
    npm install pm2 -g
fi

echo -e "${CYAN}🐍 Установка Python-библиотек...${NC}"
pip3 install -r requirements.txt --break-system-packages || pip3 install -r requirements.txt

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}      🛠  НАСТРОЙКА КОНФИГУРАЦИИ  🛠      ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo "Сейчас я задам несколько вопросов, чтобы настроить бота автоматически."
echo ""

echo -e "${BLUE}--- Telegram API ---${NC}"
ask_value "Введите Token бота (от @BotFather)" "BOT_TOKEN" ""
ask_value "Введите API ID (от my.telegram.org)" "T_API_ID" ""
ask_value "Введите API HASH (от my.telegram.org)" "T_API_HASH" ""

echo ""
echo -e "${BLUE}--- Администратор ---${NC}"
ask_value "Введите ваш Telegram ID (будете Владельцем)" "OWNER_ID" ""

echo ""
echo -e "${BLUE}--- Веб-панель ---${NC}"
ask_value "Введите домен или IP (например: https://mydomain.com)" "WEB_URL" "http://$(curl -s ifconfig.me):8082"

echo ""
echo -e "${BLUE}--- База данных ---${NC}"
RANDOM_DB_PASS=$(generate_secret 16)
ask_value "Имя пользователя БД" "DB_USER" "rewhost_user"
ask_value "Пароль БД" "DB_PASS" "$RANDOM_DB_PASS"
ask_value "Имя базы данных" "DB_NAME" "rewhost_db"

WEB_SECRET=$(generate_secret 32)

echo ""
echo -e "${CYAN}📝 Генерирую .env файл...${NC}"

cat > .env <<EOF
TELEGRAM_BOT_TOKEN="$BOT_TOKEN"
TELEGRAM_API_ID="$T_API_ID"
TELEGRAM_API_HASH="$T_API_HASH"

BOT_USERNAME="RewHosterBot"
WEB_APP_URL="$WEB_URL"

OWNER_IDS="$OWNER_ID"
CO_OWNER_IDS=""
SENIOR_ADMIN_IDS=""
ADMIN_IDS=""
JUNIOR_ADMIN_IDS=""

WEB_API_SECRET_KEY="$WEB_SECRET"
CRYPTO_PAY_TOKEN=""

INFO_CHAT_ID="$OWNER_ID"
MODERATION_CHAT_ID="$OWNER_ID"
CAPTCHA_TOPIC_ID="1"
LOG_CHAT_ID="$OWNER_ID"

DEFAULT_CPU_LIMIT="0.2"
CPU_UPGRADE_PRICE="10.0"
RAM_UPGRADE_PRICE="15.0"

DB_TYPE="postgres"
PG_HOST="localhost"
PG_PORT="5432"
PG_USER="$DB_USER"
PG_PASS="$DB_PASS"
PG_NAME="$DB_NAME"

API_ID="$T_API_ID"
API_HASH="$T_API_HASH"
SESSION_STRING=""
TARGET_CHAT_ID=""
EOF

echo -e "${CYAN}📝 Генерирую docker-compose.yml...${NC}"

cat > docker-compose.yml <<EOF
services:
  db:
    image: postgres:15-alpine
    container_name: rewhost_db
    restart: always
    environment:
      POSTGRES_USER: $DB_USER
      POSTGRES_PASSWORD: $DB_PASS
      POSTGRES_DB: $DB_NAME
    ports:
      - "5432:5432"
    volumes:
      - pg_data:/var/lib/postgresql/data

volumes:
  pg_data:
EOF

echo -e "${CYAN}🚀 Запуск базы данных...${NC}"
docker compose up -d

echo "⏳ Ожидание инициализации БД (5 сек)..."
sleep 5

echo -e "${CYAN}🔄 Накатывание миграций...${NC}"
alembic upgrade head

echo -e "${CYAN}🛠 Создание команды 'RewHost' и 'RH'...${NC}"
CLI_PATH="/usr/local/bin/RewHost"
ALIAS_PATH="/usr/local/bin/RH"

cat > "$CLI_PATH" <<EOF
#!/bin/bash
PROJECT_DIR="$PROJECT_DIR"
LOG_FILE="\$PROJECT_DIR/logs/rewhost.log"
APP_NAME="RewHost"
WORKER_NAME="RewWorker"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

command=\$1

case \$command in
  logs)
    echo -e "\${GREEN}🔍 Логи (Bot + Worker)... (Ctrl+C для выхода)\${NC}"
    pm2 logs
    ;;
  restart)
    echo -e "\${BLUE}🔄 Перезагрузка всех процессов...\${NC}"
    cd "\$PROJECT_DIR" 
    pm2 delete "\$APP_NAME" 2>/dev/null
    pm2 delete "\$WORKER_NAME" 2>/dev/null
    pm2 start bot.py --name "\$APP_NAME" --interpreter python3
    pm2 start "python3 -m taskiq worker broker:broker" --name "\$WORKER_NAME"
    pm2 save
    ;;
  stop)
    pm2 stop "\$APP_NAME" "\$WORKER_NAME"
    ;;
  start)
    cd "\$PROJECT_DIR"
    pm2 start bot.py --name "\$APP_NAME" --interpreter python3
    pm2 start "python3 -m taskiq worker broker:broker" --name "\$WORKER_NAME"
    pm2 save
    ;;
  status)
    pm2 status
    ;;
  update)
    echo -e "\${YELLOW}⬇️ Git Pull...\${NC}"
    cd "\$PROJECT_DIR"
    git pull
    echo -e "\${YELLOW}📦 Dependencies...\${NC}"
    pip3 install -r requirements.txt --break-system-packages
    echo -e "\${YELLOW}🔄 Migrations...\${NC}"
    alembic upgrade head
    echo -e "\${GREEN}✅ Restart...\${NC}"
    pm2 restart "\$APP_NAME" "\$WORKER_NAME"
    ;;
  *)
    echo "Usage: RewHost [logs|restart|stop|start|status|update]"
    ;;
esac
EOF

chmod +x "$CLI_PATH"
ln -sf "$CLI_PATH" "$ALIAS_PATH"

echo -e "${GREEN}✅ Команды 'RewHost' и 'RH' созданы!${NC}"

echo -e "${CYAN}🤖 Запуск бота и воркера в PM2...${NC}"

pm2 delete RewHost 2>/dev/null
pm2 delete RewWorker 2>/dev/null

pm2 start bot.py --name RewHost --interpreter python3

pm2 start "python3 -m taskiq worker broker:broker" --name RewWorker

pm2 save
pm2 startup | grep "sudo" | bash 2>/dev/null

echo ""
echo -e "${GREEN}==============================================${NC}"
echo -e "${GREEN}   🎉 УСТАНОВКА ЗАВЕРШЕНА УСПЕШНО! 🎉${NC}"
echo -e "${GREEN}==============================================${NC}"
echo ""
echo -e "Данные сохранены в: ${YELLOW}$PROJECT_DIR/.env${NC}"
echo -e "База данных: ${YELLOW}$DB_USER@$DB_NAME${NC}"
echo ""
echo -e "Теперь вы можете использовать команду:"
echo -e "  👉 ${CYAN}RH status${NC} - проверить состояние"
echo -e "  👉 ${CYAN}RH logs${NC} - смотреть логи"
echo -e "  👉 ${CYAN}RH restart${NC} - перезагрузить всё"
echo ""