#!/bin/bash

# Build script for Sam Blundell's website
# Compiles Tailwind CSS and prepares files for deployment

echo "Building website..."

# Compile Tailwind CSS (prefer local binary, fallback to system)
echo "Compiling Tailwind CSS..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
if [ -x "$REPO_ROOT/tailwindcss-linux-x64" ]; then
    TAILWIND_BIN="$REPO_ROOT/tailwindcss-linux-x64"
elif command -v tailwindcss >/dev/null 2>&1; then
    TAILWIND_BIN="$(command -v tailwindcss)"
else
    echo "✗ Tailwind CLI not found. Download the standalone binary or install 'tailwindcss'"
    exit 1
fi
"$TAILWIND_BIN" --config "$REPO_ROOT/tailwind.config.cjs" -i "$REPO_ROOT/src/css/input.css" -o "$REPO_ROOT/src/css/main.css" --minify

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✓ CSS compiled successfully"
else
    echo "✗ CSS compilation failed"
    exit 1
fi

echo "Build complete! Files ready for deployment."