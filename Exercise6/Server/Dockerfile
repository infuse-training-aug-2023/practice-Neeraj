FROM node:20.5

WORKDIR /app
COPY . /app

RUN npm install
EXPOSE 8000

CMD ["node","index.js"]
# docker build -t exer_s .
# docker run -p 8000:8000 exer_s