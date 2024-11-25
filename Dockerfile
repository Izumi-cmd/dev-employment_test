FROM node:20-alpine

LABEL maintainer="developer@example.com"

WORKDIR /usr/src/app

COPY app/package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
