FROM alpine

MAINTAINER Genaro Contreras
ENV SERVER_PORT="80"
ENV DB_HOST="localhost"
ENV DB_USER="root"
ENV DB_PWD=""
ENV DB_NAME="gantt"

RUN apk add mysql
run service mysql start
RUN mysql -u root  -e "CREATE DATABASE gantt"
RUN mysql -u root  -D gantt < ./app/schema.sql

COPY ./app /opt/app

WORKDIR /opt/app/
RUN apk update && apk upgrade
RUN apk add nodejs
RUN apk add npm
RUN npm install
RUN node server.js

EXPOSE $SERVER_PORT

CMD ["node server.js"]
