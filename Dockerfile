FROM node:24-alpine AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS prod

COPY package*.json ./app
COPY pnpm-*.yaml ./app
WORKDIR /app

RUN pnpm fetch --prod

COPY . .

RUN pnpm i --force

RUN pnpm -r build

FROM base

WORKDIR /app
ENV NODE_ENV=production
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3000
ENV PORT=3000

COPY --from=prod /app/.output ./.output

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
