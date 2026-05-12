FROM node:24-alpine AS builder

WORKDIR /app
COPY package*.json ./
COPY pnpm-*.yaml ./

COPY . .

RUN npm i -g pnpm

RUN pnpm i --force

RUN pnpm -r build

FROM node:24-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3000
ENV PORT=3000

COPY --from=builder /app/.output ./.output

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
