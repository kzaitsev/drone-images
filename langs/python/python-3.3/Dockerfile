FROM bugagazavr/base

WORKDIR /home/ubuntu
USER ubuntu

RUN sudo apt-get update && sudo apt-get install python3.3 python3.3-dev
RUN virtualenv --python=/usr/bin/python3.3 /home/ubuntu/.python --system-site-packages && \
    . /home/ubuntu/.python/bin/activate && \
    pip install --use-mirrors nose && \
    pip install -U pytest