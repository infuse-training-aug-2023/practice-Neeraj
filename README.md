# Docker - Neeraj Yadav

## Exercise 1 - Array manipulation using numpy and PIL 

### Dependenicies
FROM python:3.8 <br/>
RUN pip install numpy <br/>
RUN pip install numpy Pillow <br/>

CMD ["python","exercise1.py","6.0"]  # 6.0 is argument <br/>

### Docker build and run
> docker build -t exercise1:latest . <br/>
> docker run exercise1 <br/>


## Exercise 2 - Data generator using Faker and json

### Dependencies
FROM ruby:3 <br/>
RUN gem install json faker <br/>

CMD ["ruby","exercise2.rb","5"]  # 5 is argument <br/>

### Docker build and run
> docker build -t exercise2:latest . <br/>
> docker run exercise2


## Exercise 3 - Testing Ruby script using "test-unit" liberary

### Dependencies
FROM ruby:3 <br/>
RUN gem install test-unit <br/>

CMD ["ruby","unitTest3.rb"]

### Docker build and run
> docker build -t exercise3:latest . <br/>
> docker run exercise3


## Exercise 4 - Node script using javascript and external dependency "axios"

### Dependencies
FROM node:17 <br/>
ENV API_URL="https://randomuser.me/api/" <br/>
RUN npm install axios <br/>

CMD ["node","exercise4.js"]

### Docker build and run
> docker build -t exercise4:latest . <br/>
> docker run exercise4


## Exercise 5 - Node server on a port using env

## Dependencies
FROM node:20.5 <br/>
RUN npm install <br/>
EXPOSE 3000 <br/>

CMD ["node","exercise5.js"] <br/>

### Docker build and run
> docker build -t exercise5:latest . <br/>
> docker run exercise5 


## Exercise 6 - Running local front end and node backend server and docker compose

### Dependencies for react js
FROM node:20.5 <br/>
RUN npm install <br/>
EXPOSE 3000 <br/>

CMD ["npm","start"]

### Dependencies for node js 
FROM node:20.5 <br/>
RUN npm install <br/>
EXPOSE 8000 <br/>

CMD ["node","index.js"]

### Docker build and run ( create yaml docker compose file )
> docker-compose up



