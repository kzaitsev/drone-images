FROM bugagazavr/base

RUN wget -O /tmp/godeb.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz &&\
    tar xvf /tmp/godeb.tar.gz -C /tmp &&\ 
    sudo mv /tmp/godeb /usr/local/bin/godeb &&\
    sudo chmod +x /usr/local/bin/godeb &&\
    rm -f /tmp/godeb.tar.gz

RUN echo 'export GOROOT=/usr/local/go' | sudo tee /etc/drone.d/go.sh &&\
    echo 'export GOPATH=/var/cache/drone' | sudo tee --append /etc/drone.d/go.sh &&\
    echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' | sudo tee --append /etc/drone.d/go.sh