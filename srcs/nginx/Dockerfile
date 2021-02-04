FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk add nginx openssh openssl --update --no-cache
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
COPY srcs/telegraf.conf /etc
COPY srcs/nginx.conf /etc/nginx/
COPY srcs/start.sh /
ENTRYPOINT sh start.sh
EXPOSE 80 443
