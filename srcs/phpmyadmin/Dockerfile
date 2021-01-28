FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mkdir -p /www
RUN tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv phpmyadmin /www
RUN rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
COPY srcs/phpmyadmin.inc.php /www/phpmyadmin/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx
COPY srcs/start.sh .
EXPOSE 5000
CMD sh start.sh