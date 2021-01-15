FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN		apk add mariadb mariadb-client openrc
ADD		srcs/ /root
EXPOSE 3306
CMD		[ "/bin/ash", "/root/start.sh" ]