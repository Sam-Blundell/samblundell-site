#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PORT=${PORT:-8000}

if command -v python3 >/dev/null 2>&1; then
    exec python3 -m http.server "$PORT" --directory "$REPO_ROOT/src"
elif command -v python >/dev/null 2>&1; then
    exec python -m http.server "$PORT" --directory "$REPO_ROOT/src"
elif command -v busybox >/dev/null 2>&1; then
    exec busybox httpd -f -p "$PORT" -h "$REPO_ROOT/src"
else
    echo "✗ No suitable static server found (python3, python, or busybox)." >&2
    exit 1
fi
