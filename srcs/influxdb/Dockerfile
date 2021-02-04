FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add influxdb
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY srcs/start.sh .
COPY srcs/telegraf.conf /etc/
CMD sh start.sh
EXPOSE 8086