# Docker - Neeraj Yadav

## Exercise 1 - Array manipulation using numpy and PIL 

### Dependenicies
FROM python:3.8
RUN pip install numpy
RUN pip install numpy Pillow

CMD ["python","exercise1.py","6.0"]  # 6.0 is argument

### Docker build and run
> docker build -t exercise1:latest .
> docker run exercise1


## Exercise 2 - Data generator using Faker and json

### Dependencies
FROM ruby:3
RUN gem install json faker

CMD ["ruby","exercise2.rb","5"]  # 5 is argument

### Docker build and run
> docker build -t exercise2:latest .
> docker run exercise2


## Exercise 3 - Testing Ruby script using "test-unit" liberary

### Dependencies
FROM ruby:3
RUN gem install test-unit

CMD ["ruby","unitTest3.rb"]

### Docker build and run
> docker build -t exercise3:latest .
> docker run exercise3


## Exercise 4 - Node script using javascript and external dependency "axios"

### Dependencies
FROM node:17
ENV API_URL="https://randomuser.me/api/"
RUN npm install axios

CMD ["node","exercise4.js"]

### Docker build and run
> docker build -t exercise4:latest .
> docker run exercise4


## Exercise 5 - Node server on a port using env

## Dependencies
FROM node:20.5
RUN npm install
EXPOSE 3000

CMD ["node","exercise5.js"]

### Docker build and run
> docker build -t exercise5:latest .
> docker run exercise5


## Exercise 6 - Running local front end and node backend server and docker compose

### Dependencies for react js
FROM node:20.5
RUN npm install
EXPOSE 3000

CMD ["npm","start"]

### Dependencies for node js 
FROM node:20.5
RUN npm install
EXPOSE 8000

CMD ["node","index.js"]

### Docker build and run ( create yaml docker compose file )
> docker-compose up



