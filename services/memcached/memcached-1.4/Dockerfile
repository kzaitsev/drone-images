FROM ubuntu:14.04
RUN apt-get -qq update && apt-get -y install gcc make wget libevent-dev &&\
    wget -O memcached.tar.gz http://memcached.org/files/memcached-1.4.21.tar.gz &&\
    tar xzf memcached.tar.gz &&\
    rm memcached.tar.gz &&\
    cd memcached-* &&\
    ./configure --prefix=/usr/local &&\
    make install &&\
    cd .. && rm -rf memcached-* &&\
    apt-get clean
EXPOSE 11211
ENTRYPOINT ["/usr/local/bin/memcached"]
CMD ["-u", "root", "-m", "64"]