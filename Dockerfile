FROM node:18-alpine AS development
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "start:dev"]


# FROM node:18-alpine AS production
# WORKDIR /app 
# COPY package*.json ./
# RUN ["npm","install","--omit=dev"]
# COPY --from=builder /app/dist/ ./
# EXPOSE 3000
# CMD ["node" , "main.js"]