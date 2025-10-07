#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PORT=${PORT:-8000}

if ! command -v bun >/dev/null 2>&1; then
    echo "✗ Bun not found. Install Bun to use live-server via bunx." >&2
    exit 1
fi

exec bunx --bun live-server "$REPO_ROOT/src" --port="$PORT" --no-browser
