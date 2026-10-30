#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
if ! command -v node >/dev/null; then echo 'Install Node.js 20+ first (operator computer only).';exit 1;fi
echo 'Open http://localhost:3001 in your browser'
node server/index.js
