#!/usr/bin/env bash
set -euo pipefail

# Config (override via env)
REMOTE_USER=${REMOTE_USER:-jakdaw}
REMOTE_HOST=${REMOTE_HOST:-samblundell.co.uk}
SITE_NAME=${SITE_NAME:-samblundell.co.uk}
REMOTE_TMP=${REMOTE_TMP:-/tmp/nginx-sync}

LOCAL_INFRA_DIR="$(cd "$(dirname "$0")/.." && pwd)/infra/nginx"

echo "Syncing nginx config to ${REMOTE_HOST}..."
ssh "${REMOTE_USER}@${REMOTE_HOST}" "rm -rf '${REMOTE_TMP}' && mkdir -p '${REMOTE_TMP}' '{REMOTE_TMP}/conf.d' '{REMOTE_TMP}/sites-available'" || true
rsync -av --delete "${LOCAL_INFRA_DIR}/nginx.conf" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_TMP}/nginx.conf"
rsync -av --delete "${LOCAL_INFRA_DIR}/conf.d/" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_TMP}/conf.d/" || true
rsync -av --delete "${LOCAL_INFRA_DIR}/sites-available/" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_TMP}/sites-available/"

echo "Applying config with sudo on remote..."
ssh -tt "${REMOTE_USER}@${REMOTE_HOST}" bash -lc "\
  sudo cp '${REMOTE_TMP}/nginx.conf' /etc/nginx/nginx.conf && \
  sudo mkdir -p /etc/nginx/conf.d /etc/nginx/sites-available /etc/nginx/sites-enabled && \
  sudo cp -a '${REMOTE_TMP}/conf.d/.' /etc/nginx/conf.d/ && \
  sudo cp -a '${REMOTE_TMP}/sites-available/.' /etc/nginx/sites-available/ && \
  sudo ln -sf /etc/nginx/sites-available/${SITE_NAME} /etc/nginx/sites-enabled/${SITE_NAME} && \
  sudo nginx -t && \
  sudo systemctl reload nginx && \
  sudo rm -rf '${REMOTE_TMP}'
"

echo "Done. Verify with: curl -I -H 'Accept-Encoding: gzip' https://${SITE_NAME}/css/main.css"