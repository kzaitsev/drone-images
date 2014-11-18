FROM bugagazavr/kerl

WORKDIR /home/ubuntu
USER ubuntu

RUN echo "source /opt/erlang_17_1/activate" | sudo tee --append /etc/drone.d/erl.sh
RUN sudo mkdir -p /opt/erlang_17_1/ && kerl build 17.1 17.1 && \
    sudo chown -R ubuntu:ubuntu /opt/erlang_17_1/ && \
    kerl install 17.1 /opt/erlang_17_1/ && rm -rf 17.1