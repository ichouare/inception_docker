FROM debian:bullseye


RUN apt-get  update && apt-get install -y vsftpd
COPY ./vsftpd.conf /etc/vsftpd.conf
#RUN   mkdir /home/ichouare/files
#RUN chmmod root:root /home/ichouare


#RUN CONFIG SET protected-mode no
#RUN service redis-server start 
CMD ["/usr/sbin/vsftpd"]
