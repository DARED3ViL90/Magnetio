#!/bin/sh

set -e

echo "Starting Magnetio scraper on port 8080..."

cd /app/scraper
PORT=8080 node index.js &
SCRAPER_PID=$!

echo "Scraper started with PID $SCRAPER_PID"

sleep 2

echo "Starting Magnetio addon on port 10000..."

cd /app/addon
PORT=10000 node index.js
