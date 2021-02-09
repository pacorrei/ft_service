export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/CN=172.17.0.2"
echo -e "admin\nadmin" | adduser admin
telegraf &

usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf