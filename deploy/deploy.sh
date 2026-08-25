#!/bin/sh
# Déploie guillaumejacquart.com sur le VPS : copie le compose puis (re)lance la stack.
#   ./deploy/deploy.sh
set -e

HOST="${VPS_HOST:-vps.guillaumejacquart.com}"
USER="${VPS_USER:-ubuntu}"
REMOTE_FILE="/home/ubuntu/docker/services/guillaumejacquart.com.yml"
COMPOSE_DIR="/home/ubuntu/docker"

# Chemin du compose local, indépendant du dossier d'appel.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL_FILE="$SCRIPT_DIR/../docker-compose.yml"

echo "→ Copie de docker-compose.yml vers $USER@$HOST:$REMOTE_FILE"
scp "$LOCAL_FILE" "$USER@$HOST:$REMOTE_FILE"

echo "→ ./compose.sh pull guillaumejacquart-com"
ssh "$USER@$HOST" "cd $COMPOSE_DIR && ./compose.sh pull guillaumejacquart-com"

echo "→ ./compose.sh up -d dans $COMPOSE_DIR"
ssh "$USER@$HOST" "cd $COMPOSE_DIR && ./compose.sh up -d guillaumejacquart-com"

echo "✓ Déploiement terminé."
