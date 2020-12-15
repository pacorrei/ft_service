openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/CN=localhost"
echo -e "passwd\npasswd" | adduser admin

/usr/sbin/pure-ftpd -p 21000:21000 -P localhost