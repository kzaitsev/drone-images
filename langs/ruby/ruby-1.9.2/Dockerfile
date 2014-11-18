FROM bugagazavr/base

WORKDIR /home/ubuntu
USER ubuntu

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 &&\
	/bin/bash -l -c "rvmsudo rvm get stable" &&\
    /bin/bash -l -c "rvmsudo rvm install 1.9.2 --default" &&\
    /bin/bash -l -c "gem install bundler fpm --no-ri --no-rdoc" &&\
    /bin/bash -l -c "rvmsudo rvm cleanup all"