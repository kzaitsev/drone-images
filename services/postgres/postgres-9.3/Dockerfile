FROM ubuntu:14.04

RUN apt-get -qq update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y -qq postgresql-9.3 postgresql-contrib-9.3 && \
    mkdir -p /usr/local/pgsql/data

ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf

USER postgres
EXPOSE 5432
ENTRYPOINT ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf", "-c", "listen_addresses=*" ]