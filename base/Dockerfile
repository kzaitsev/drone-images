FROM ubuntu:14.04

RUN adduser --home /home/ubuntu --shell /bin/bash --disabled-password --gecos "" ubuntu

ADD rootfs/etc /etc/
ADD rootfs/root /root/
ADD rootfs/home /home/

RUN chown -R ubuntu:ubuntu /home/ubuntu && chmod 0440 /etc/sudoers.d/ubuntu && chown -R root:root /etc/sudoers*

RUN apt-get update -qq && apt-get upgrade -y -qq

# Build tools
RUN apt-get install build-essential llvm clang automake autoconf autogen libtool make cmake gdb bison \
    scons &&\
    apt-get clean

# Libs
RUN apt-get install -y libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev \
    sqlite3 libxml2-dev libxslt-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev \
    libc6-dev ncurses-dev libmagickwand-dev imagemagick libffi-dev libffi6 \
    libncurses5 libncurses5-dev libncurses5-dbg libqt4-dev libyaml-0-2 libyaml-dev \
    libossp-uuid-dev libxslt1-dev libsqlite3-dev &&\
    apt-get clean

# Additional
RUN apt-get install curl wget git git-core subversion mercurial bzr fossil xvfb socat unzip zip rpm -y &&\
    apt-get clean

# Database/Datastore clients and libs
RUN apt-get install libmysqlclient-dev mysql-client libpq-dev libmemcache-dev postgresql-client -y &&\
    apt-get clean

# Python
RUN apt-get install python2.7 software-properties-common python-software-properties python-setuptools python-dev -y && \
    easy_install pip && pip install distribute --upgrade && chown -R ubuntu:ubuntu /usr/local/lib/python2.7 &&\
    apt-get clean

# Virtualenv
RUN sudo easy_install virtualenv &&\
    sudo add-apt-repository --yes ppa:fkrull/deadsnakes &&\
    mkdir -p /home/ubuntu/.python &&\
    chown ubuntu:ubuntu -R /home/ubuntu/.python &&\
    echo "[[ -s "$HOME/.python/bin/activate" ]] && source $HOME/.python/bin/activate" | sudo tee /etc/drone.d/python.sh

# RVM and default ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 &&\
    curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements" &&\ 
    /bin/bash -l -c "rvm install 2.0 --default" &&\ 
    /bin/bash -l -c "gem install bundler fpm --no-ri --no-rdoc" &&\
    /bin/bash -l -c "rvm cleanup all" &&\
    ln -s /etc/profile.d/rvm.sh /etc/drone.d/rvm.sh &&\
    usermod -aG rvm ubuntu

# Install phantomjs
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
    tar xjf phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
    install -t /usr/local/bin phantomjs-1.9.8-linux-x86_64/bin/phantomjs &&\
    rm -rf phantomjs-1.9.8-linux-x86_64 &&\
    rm phantomjs-1.9.8-linux-x86_64.tar.bz2

RUN locale-gen en_US en_US.UTF-8

WORKDIR /home/ubuntu
USER ubuntu

# NVM and default nodejs
RUN git clone git://github.com/creationix/nvm.git /home/ubuntu/.nvm &&\
    /bin/bash -l -c "source /etc/drone.d/nvm.sh && nvm install stable" &&\
    /bin/bash -l -c "source /etc/drone.d/nvm.sh && nvm alias default stable" &&\
    /bin/bash -l -c "source /etc/drone.d/nvm.sh && npm -g install less" &&\
    chown -R ubuntu:ubuntu /home/ubuntu/.nvm

ENV rvmsudo_secure_path 1
ENV HOME /home/ubuntu
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LOGNAME ubuntu
ENV TERM xterm