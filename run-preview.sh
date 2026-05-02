#!/usr/bin/env bash
set -euo pipefail
PORT="${1:-8080}"
echo "Starting Manarah preview on http://localhost:${PORT}/web/index.html"
python3 -m http.server "${PORT}"
