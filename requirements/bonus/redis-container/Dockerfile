FROM debian:bullseye


RUN apt-get  update && apt-get install -y redis-server  systemd
COPY ./redis.conf /etc/redis/redis.conf
#RUN echo "maxmemory 2gb" >> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf && echo "protected-mode no" >> /etc/redis/redis.conf 
#RUN CONFIG SET protected-mode no
#RUN service redis-server reload
RUN echo "redis start"
CMD  ["redis-server", "--protected-mode", "no"]
