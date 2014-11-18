FROM bugagazavr/base

WORKDIR /home/ubuntu
USER ubuntu

RUN sudo add-apt-repository -y ppa:webupd8team/java &&\
    sudo apt-get update -qq &&\
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&\
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections &&\
    DEBIAN_FRONTEND=noninteractive sudo apt-get install oracle-java7-installer -y