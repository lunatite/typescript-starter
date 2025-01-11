ARG NODE_VERSION=18.0.0

FROM node:${NODE_VERSION}-alpine as base
WORKDIR /usr/src/app

FROM base as dev
RUN mkdir -p /usr/src/app/dist && \
    chown -R node:node /usr/src/app && \
    chmod -R 775 /usr/src/app/dist
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
        npm ci --include=dev
COPY . .
USER node
CMD npm run start:dev