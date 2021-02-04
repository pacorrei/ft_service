FROM alpine
MAINTAINER pacorrei <pacorrei@student.42.fr>
RUN apk update
RUN apk add nginx
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk add php7-fpm php7-mcrypt php7-session php7-soap php7-openssl php7-gmp \
	php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli \
	php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
	php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader \
	php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype \
	php7-opcache php7-zlib php7-common php7-iconv php7-xml php7-imap php7-cgi \
	fcgi php7-posix php7-ldap php7-mbstring
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -xzvf latest-fr_FR.tar.gz
RUN rm latest-fr_FR.tar.gz
RUN mkdir /www
RUN mv wordpress /www/
RUN mkdir -p /run/nginx
RUN rm -rf /etc/telegraf.conf
COPY srcs/wp-config.php /www/wordpress/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/telegraf.conf /etc/
COPY srcs/start.sh .
EXPOSE 5050
CMD sh start.sh