#!/bin/sh

service vsftpd start

adduser $ftp_user --disabled-password

echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd

echo "$ftp_user" | tee -a /etc/vsftpd.userlist 


mkdir /home/$ftp_user/ftp

echo "user_sub_token=$ftp_user" >> /etc/vsftpd.conf
echo "local_root=/home/$ftp_user/ftp" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
cat  ./vsftpd.conf >> /etc/vsftpd.conf

chown nobody:nogroup /home/$ftp_user/ftp
chmod a-w /home/$ftp_user/ftp

mkdir /home/$ftp_user/ftp/files
chown $ftp_user:$ftp_user /home/$ftp_user/ftp/files


service vsftpd stop

exec usr/sbin/vsftpd

