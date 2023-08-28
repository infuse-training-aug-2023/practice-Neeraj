FROM node:20.5

WORKDIR /app
COPY . /app

RUN npm i
EXPOSE 3000

CMD ["npm","start"]

## docker build -t exer_c .
# docker run -p 3000:3000 exer_c