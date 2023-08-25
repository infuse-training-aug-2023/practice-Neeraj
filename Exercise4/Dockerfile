FROM node:17

WORKDIR /app
COPY . /app
ENV API_URL="https://randomuser.me/api/"

RUN npm install axios

CMD ["node","exercise4.js"]