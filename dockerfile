# Deployment principle: Build once, run many.

# -----------------
# Builder
# -----------------

FROM node:24-bookworm-slim AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# -----------------
# Runtime
# -----------------

FROM node:24-bookworm-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist

EXPOSE 2900:2900

CMD ["node", "dist/server.js"]