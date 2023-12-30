FROM debian:bullseye


RUN apt-get  update && apt-get install -y redis-server  systemd
COPY ./redis.conf /etc/redis/redis.conf
RUN echo "redis start"
CMD  ["redis-server", "--protected-mode", "no"]
