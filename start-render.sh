#!/bin/sh

set -e

echo "Starting Magnetio scraper..."

cd /app/scraper
node index.js &
SCRAPER_PID=$!

echo "Scraper started with PID $SCRAPER_PID"

sleep 2

echo "Starting Magnetio addon..."

cd /app/addon
exec node index.js
