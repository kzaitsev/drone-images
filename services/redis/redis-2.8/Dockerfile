FROM ubuntu:14.04

RUN apt-get -qq update && apt-get -y install gcc make wget &&\
    wget -O redis.tar.gz http://download.redis.io/releases/redis-2.8.17.tar.gz &&\
    tar xzf redis.tar.gz &&\
    cd redis-* &&\
    make &&\
    install -t /usr//bin src/redis-server &&\
    cd .. &&\
    rm redis.tar.gz && rm -rf redis-* &&\
    mkdir /etc/redis &&\
    wget --quiet --no-check-certificate http://raw.github.com/antirez/redis/2.8/redis.conf -O /etc/redis/redis.conf &&\
    apt-get clean

EXPOSE 6379
ENTRYPOINT  ["/usr/bin/redis-server"]