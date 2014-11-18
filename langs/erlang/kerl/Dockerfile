FROM bugagazavr/base

RUN sudo wget -O /usr/local/bin/rebar https://github.com/rebar/rebar/releases/download/2.5.1/rebar && \
	sudo chmod a+x /usr/local/bin/rebar

RUN curl https://raw.githubusercontent.com/yrashk/kerl/master/kerl | sudo tee /usr/local/bin/kerl && \
	sudo chmod a+x /usr/local/bin/kerl

RUN \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s && \
    echo '[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"' | sudo tee /etc/drone.d/erl.sh