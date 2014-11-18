FROM bugagazavr/erlang:17.3

WORKDIR /home/ubuntu
USER ubuntu

RUN /bin/bash -l -c "source /etc/drone.d/erl.sh && kiex selfupdate" &&\
    /bin/bash -l -c "source /etc/drone.d/erl.sh && kiex install 1.0.0" &&\
    /bin/bash -l -c "source /etc/drone.d/erl.sh && kiex default 1.0.0"