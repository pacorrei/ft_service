FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY /srcs/telegraf.conf /etc/telegraf/
COPY /srcs/start.sh .
COPY srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
RUN mv /usr/sbin/grafana-server /usr/share/grafana/
CMD sh start.sh
EXPOSE 3000