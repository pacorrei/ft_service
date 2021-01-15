FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add openssl
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY srcs/start.sh .
EXPOSE 21 21000 
CMD sh start.sh