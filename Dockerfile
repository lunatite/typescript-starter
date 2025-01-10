FROM node:16-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN ["npm","install","--production"]
COPY . .

FROM node:16-alpine as development
WORKDIR /app
COPY --from=build /app .
CMD ["npm", "run", "start:dev"]