FROM debian:bullseye


RUN apt-get  update && apt-get install -y vsftpd
#COPY ./vsftpd.conf .
COPY ./script.sh  .
RUN chmod +x ./script.sh
EXPOSE 21
CMD ["bash", "./script.sh" ]
