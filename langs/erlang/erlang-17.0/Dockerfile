FROM bugagazavr/kerl

WORKDIR /home/ubuntu
USER ubuntu

RUN echo "source /opt/erlang_17_0/activate" | sudo tee --append /etc/drone.d/erl.sh
RUN sudo mkdir -p /opt/erlang_17_0/ && kerl build 17.0 17.0 && \
    sudo chown -R ubuntu:ubuntu /opt/erlang_17_0/ && \
    kerl install 17.0 /opt/erlang_17_0/ && rm -rf 17.0