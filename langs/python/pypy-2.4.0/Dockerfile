FROM bugagazavr/base

WORKDIR /home/ubuntu
USER ubuntu

RUN sudo add-apt-repository --yes ppa:pypy/ppa && \
    sudo apt-get -qq update && \
    sudo apt-get install pypy=2.4.0*

RUN virtualenv --python=/usr/bin/pypy /home/ubuntu/.python &&\
    . /home/ubuntu/.python/bin/activate &&\
    pip install --use-mirrors nose && \
    pip install -U pytest