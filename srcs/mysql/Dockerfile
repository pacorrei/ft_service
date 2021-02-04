FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN	apk add mariadb mariadb-client openrc
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY srcs/start.sh /root
COPY srcs/telegraf.conf /etc/
EXPOSE 3306
CMD		[ "/bin/ash", "/root/start.sh" ]