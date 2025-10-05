#!/bin/bash

set -e

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

exec "$TAILWIND_BIN" --config "$REPO_ROOT/tailwind.config.cjs" -i "$REPO_ROOT/src/css/input.css" -o "$REPO_ROOT/src/css/main.css" --watch
