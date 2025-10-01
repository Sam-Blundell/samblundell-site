#!/bin/bash

# Build script for Sam Blundell's website
# Compiles Tailwind CSS and prepares files for deployment

echo "Building website..."

# Compile Tailwind CSS (use system tailwindcss, fallback to local binary)
echo "Compiling Tailwind CSS..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if command -v tailwindcss >/dev/null 2>&1; then
    TAILWIND_BIN="$(command -v tailwindcss)"
elif [ -x "$SCRIPT_DIR/tailwindcss-linux-x64" ]; then
    TAILWIND_BIN="$SCRIPT_DIR/tailwindcss-linux-x64"
else
    echo "✗ Tailwind CLI not found. Install 'tailwindcss' or add $SCRIPT_DIR/tailwindcss-linux-x64"
    exit 1
fi
"$TAILWIND_BIN" -i "$SCRIPT_DIR/src/css/input.css" -o "$SCRIPT_DIR/src/css/main.css" --minify --content "$SCRIPT_DIR/src/**/*.html"

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✓ CSS compiled successfully"
else
    echo "✗ CSS compilation failed"
    exit 1
fi

echo "Build complete! Files ready for deployment."