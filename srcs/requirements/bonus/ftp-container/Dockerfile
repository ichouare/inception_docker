FROM debian:bullseye


RUN apt-get  update && apt-get install -y vsftpd

#RUN  cat ./vsftpd.conf >  /etc/vsftpd.conf
COPY ./script.sh  .
RUN chmod +x ./script.sh
EXPOSE 21
CMD ["bash" , "./script.sh" ]
