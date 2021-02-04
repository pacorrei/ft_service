FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add openssl vsftpd
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY srcs/start.sh .
COPY srcs/telegraf.conf /etc/
COPY srcs/vsftpd.conf /etc/vsftpd/
EXPOSE 21 30000
CMD sh start.sh