FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -y openjdk-7-jre-headless curl &&\
    curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.deb > /tmp/elasticsearch.deb &&\
    dpkg -i /tmp/elasticsearch.deb && \
    rm -f /tmp/elasticsearch.deb &&\
    rm /etc/elasticsearch/elasticsearch.yml &&\
    apt-get clean

EXPOSE 9200
ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]
CMD ["-Des.index.store.type=memory", "-Des.default.path.conf=/etc/elasticsearch/"]
