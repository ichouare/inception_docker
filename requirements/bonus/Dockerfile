FROM debian:bullseye


RUN apt-get  update && apt-get install -y redis-server 
COPY ./tools/redis.conf /etc/redis/redis.conf
#RUN echo "maxmemory 2gb" >> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf && echo "protected-mode no" >> /etc/redis/redis.conf 
#RUN CONFIG SET protected-mode no
#RUN service redis-server start 
CMD ["redis-server", "/etc/redis/redis.conf"]
