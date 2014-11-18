FROM bugagazavr/base

WORKDIR /home/ubuntu
USER ubuntu

RUN /bin/bash -l -c "source /etc/drone.d/nvm.sh && nvm install 0.10" &&\
    /bin/bash -l -c "source /etc/drone.d/nvm.sh && nvm alias default 0.10" &&\
    /bin/bash -l -c "source /etc/drone.d/nvm.sh && npm -g install less"