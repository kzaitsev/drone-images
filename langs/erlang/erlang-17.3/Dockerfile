FROM bugagazavr/kerl

WORKDIR /home/ubuntu
USER ubuntu

RUN echo "source /opt/erlang_17_3/activate" | sudo tee --append /etc/drone.d/erl.sh
RUN sudo mkdir -p /opt/erlang_17_3/ && kerl build 17.3 17.3 && \
    sudo chown -R ubuntu:ubuntu /opt/erlang_17_3/ && \
    kerl install 17.3 /opt/erlang_17_3/ && rm -rf 17.3