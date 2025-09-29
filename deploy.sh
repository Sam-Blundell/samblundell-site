#!/bin/bash

# Deployment script for Sam Blundell's website
# Copies built files to the VPS web directory

VPS_USER="jakdaw"  # Change this to your VPS username
VPS_HOST="samblundell.co.uk"  # Your domain/IP
WEB_ROOT="/var/www/samblundell.co.uk/html"

echo "Deploying to VPS..."

# Build the site first
echo "Building site..."
./build.sh

if [ $? -ne 0 ]; then
    echo "Build failed, aborting deployment"
    exit 1
fi

# Copy files to VPS
echo "Copying files to VPS..."
rsync -avz --delete src/ ${VPS_USER}@${VPS_HOST}:${WEB_ROOT}/ \
    --exclude="css/input.css" \
    --exclude="tailwindcss-linux-x64"

if [ $? -eq 0 ]; then
    echo "✓ Files copied successfully"
    echo "✓ Deployment complete!"
    echo "Visit https://samblundell.co.uk to see your site"
else
    echo "✗ Deployment failed"
    exit 1
fi
