FROM bugagazavr/openjdk:1.7

WORKDIR /home/ubuntu
USER ubuntu

RUN sudo wget -O /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/2.4.3/bin/lein &&\
    sudo chmod +x /usr/local/bin/lein &&\
    lein