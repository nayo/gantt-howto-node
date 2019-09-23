FROM alpine

MAINTAINER Genaro Contreras
ENV SERVER_PORT= "80"
ENV DB_HOST = "localhost"
ENV DB_USER = "root"
ENV DB_PWD = ""
ENV DB_NAME = "gantt"


RUN apk update && apk upgrade
RUN apk add nodejs
RUN npm install
RUN node server.js

EXPOSE $SERVER_PORT

CMD ["node server.js"]
