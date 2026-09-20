FROM node:22-bookworm-slim

WORKDIR /app

# Install scraper dependencies
COPY scraper/package*.json ./scraper/
RUN cd scraper && npm ci --omit=dev

# Install addon dependencies
COPY addon/package*.json ./addon/
RUN cd addon && npm ci --omit=dev

# Copy application source
COPY scraper ./scraper
COPY addon ./addon

# Render exposes the addon
ENV PORT=10000
ENV SCRAPER_URL=http://127.0.0.1:8080

EXPOSE 10000

COPY start-render.sh /app/start-render.sh
RUN chmod +x /app/start-render.sh

CMD ["/app/start-render.sh"]
