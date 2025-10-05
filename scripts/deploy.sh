#!/bin/bash

# Deployment script for Sam Blundell's website
# Copies built files to the VPS web directory

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Load .env if present (allows overriding defaults)
if [ -f "$REPO_ROOT/.env" ]; then
  set -a
  . "$REPO_ROOT/.env"
  set +a
fi

# Defaults (can be overridden by env or .env)
VPS_USER=${VPS_USER:-jakdaw}
VPS_HOST=${VPS_HOST:-samblundell.co.uk}
WEB_ROOT=${WEB_ROOT:-/var/www/samblundell.co.uk/html}

echo "Deploying to VPS ${VPS_USER}@${VPS_HOST}..."

# Build the site first
echo "Building site..."
if ! "$REPO_ROOT/scripts/build.sh"; then
    echo "Build failed, aborting deployment"
    exit 1
fi

# Copy files to VPS
echo "Copying files to VPS..."
rsync -avz --delete "$REPO_ROOT/src/" "${VPS_USER}@${VPS_HOST}:${WEB_ROOT}/" \
    --exclude="css/input.css" \
    --exclude="tailwindcss-linux-x64"

if [ $? -eq 0 ]; then
    echo "✓ Files copied successfully"
    echo "✓ Deployment complete!"
    echo "Visit https://${VPS_HOST} to see your site"
else
    echo "✗ Deployment failed"
    exit 1
fi
