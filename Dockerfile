FROM node:18-alpine

COPY package*.json ./

RUN npm install express

COPY . .

EXPOSE 3000

CMD [ "node", "index.js" ]

