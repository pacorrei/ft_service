FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -xzvf latest-fr_FR.tar.gz
RUN rm latest-fr_FR.tar.gz
RUN mkdir /www
RUN mv wordpress /www/
COPY srcs/wp-config.php /www/wordpress/
COPY srcs/start.sh .
EXPOSE 5050
CMD sh start.sh