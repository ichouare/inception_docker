FROM debian:bullseye


RUN apt-get  update && apt-get install -y redis-server redis  php-redis

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN service redis-server start 
CMD ["redis-server"]
