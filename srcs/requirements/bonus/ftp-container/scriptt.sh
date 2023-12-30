#!/bin/bash

# start vsftpd service
service vsftpd start
# create ftp user
adduser --gecos "" --disabled-password $FTP_USER 
# set password for ftp user
echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd



# Create the ftp folder for files
mkdir -p /home/ftp/files
# set its permissions to nobody
chown -R nobody:nogroup /home/ftp/files
# set its ownership
chown -R $FTP_USER:$FTP_USER /home/ftp/files

# disables anonymous login to the FTP server
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;

# enables write permissions for the FTP users.
echo "write_enable=YES" >> /etc/vsftpd.conf;

# sets the chroot jail for local users to their home directory
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;

# allows write access for local within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

# set the FTP_USER as user substitution token
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf

# enables local user login
echo "local_enable=YES" >> /etc/vsftpd.conf

# line sets the FTP root directory for the local user to /home/ftp
echo "local_root=/home/ftp" >> /etc/vsftpd.conf

# sets the minimum port for passive mode data connections
echo "pasv_min_port=40000" >> /etc/vsftpd.conf

 sets the maximum port for passive mode data connections
echo "pasv_max_port=40005" >> /etc/vsftpd.conf

# enables the use of the userlist_file option
echo "userlist_enable=YES" >> /etc/vsftpd.conf

# sets the path to the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# sets that the file's contents will be used to specify users who are NOT allowed to log in
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# appends the value of the FTP_USER variable to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# stop the service of vsftpd
service vsftpd stop

exec usr/sbin/vsftpd
