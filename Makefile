IMAGES := $(shell docker images | grep "^bugagazavr/*" | awk '{print $$1":"$$2}')
IMAGES_IDS := $(shell docker images | grep "^bugagazavr/*" | awk '{print $$3}')
IMAGES_ALL := $(shell docker images -a -q)
CONTAINERS_ALL := $(shell docker ps -a -q)

all: image langs services

langs: java scala clojure ruby python nodejs erlang elixir go

services: postgres memcached elasticsearch redis

deploy:
	for image in ${IMAGES} ; do \
		docker push $$image ; \
	done

fclean:
	docker rm -f ${CONTAINERS_ALL}
	docker rmi -f ${IMAGES_ALL}

clean: 
	docker rmi -f ${IMAGES_IDS}

image:
	docker build --rm -t bugagazavr/base ./base

clojure:
	docker build --rm -t bugagazavr/lein:2.5.0 ./langs/clojure/lein-2.5.0
	docker build --rm -t bugagazavr/lein:2.4.3 ./langs/clojure/lein-2.4.3

erlang:
	docker build --rm -t bugagazavr/kerl ./langs/erlang/kerl
	docker build --rm -t bugagazavr/erlang:17.3 ./langs/erlang/erlang-17.3
	docker build --rm -t bugagazavr/erlang:17.1 ./langs/erlang/erlang-17.1
	docker build --rm -t bugagazavr/erlang:17.0 ./langs/erlang/erlang-17.0

java:
	docker build --rm -t bugagazavr/openjdk:1.7 ./langs/java/openjdk-1.7
	docker build --rm -t bugagazavr/openjdk:1.6 ./langs/java/openjdk-1.6
	docker build --rm -t bugagazavr/jdk:1.8 ./langs/java/jdk-1.8
	docker build --rm -t bugagazavr/jdk:1.7 ./langs/java/jdk-1.7
	docker build --rm -t bugagazavr/jdk:1.6 ./langs/java/jdk-1.6

scala:
	docker build --rm -t bugagazavr/sbt:0.13 ./langs/scala/sbt-0.13

elixir:
	docker build --rm -t bugagazavr/elixir:1.0.2 ./langs/elixir/elixir-1.0.2
	docker build --rm -t bugagazavr/elixir:1.0.1 ./langs/elixir/elixir-1.0.1
	docker build --rm -t bugagazavr/elixir:1.0.0 ./langs/elixir/elixir-1.0.0

python:
	docker build --rm -t bugagazavr/python:3.4 ./langs/python/python-3.4
	docker build --rm -t bugagazavr/python:3.3 ./langs/python/python-3.3
	docker build --rm -t bugagazavr/python:3.2 ./langs/python/python-3.2
	docker build --rm -t bugagazavr/python:3.1 ./langs/python/python-3.1
	docker build --rm -t bugagazavr/python:2.7 ./langs/python/python-2.7
	docker build --rm -t bugagazavr/python:2.6 ./langs/python/python-2.6
	docker build --rm -t bugagazavr/pypy:2.4.0 ./langs/python/pypy-2.4.0
	
ruby:
	docker build --rm -t bugagazavr/ruby:2.2.2 ./langs/ruby/ruby-2.2.2
	docker build --rm -t bugagazavr/ruby:2.2.1 ./langs/ruby/ruby-2.2.1
	docker build --rm -t bugagazavr/ruby:2.2.0 ./langs/ruby/ruby-2.2.0
	docker build --rm -t bugagazavr/ruby:2.1.5 ./langs/ruby/ruby-2.1.5
	docker build --rm -t bugagazavr/ruby:2.1.4 ./langs/ruby/ruby-2.1.4
	docker build --rm -t bugagazavr/ruby:2.1.3 ./langs/ruby/ruby-2.1.3
	docker build --rm -t bugagazavr/ruby:2.1.2 ./langs/ruby/ruby-2.1.2
	docker build --rm -t bugagazavr/ruby:2.1.1 ./langs/ruby/ruby-2.1.1
	docker build --rm -t bugagazavr/ruby:2.1.0 ./langs/ruby/ruby-2.1.0
	docker build --rm -t bugagazavr/ruby:2.0.0 ./langs/ruby/ruby-2.0.0
	docker build --rm -t bugagazavr/ruby:1.9.3 ./langs/ruby/ruby-1.9.3
	docker build --rm -t bugagazavr/ruby:1.9.2 ./langs/ruby/ruby-1.9.2
	docker build --rm -t bugagazavr/ruby:1.8.7 ./langs/ruby/ruby-1.8.7
	docker build --rm -t bugagazavr/jruby:1.7.16 ./langs/ruby/jruby-1.7.16
	docker tag -f bugagazavr/ruby:2.2.2 bugagazavr/ruby:latest

nodejs:
	docker build --rm -t bugagazavr/nodejs:0.10 ./langs/nodejs/nodejs-0.10
	docker build --rm -t bugagazavr/nodejs:0.9 ./langs/nodejs/nodejs-0.9
	docker build --rm -t bugagazavr/nodejs:0.8 ./langs/nodejs/nodejs-0.8

go:
	docker build --rm -t bugagazavr/godeb ./langs/go/godeb
	docker build --rm -t bugagazavr/go:1.4.0 ./langs/go/go-1.4.0
	docker build --rm -t bugagazavr/go:1.3.3 ./langs/go/go-1.3.3

postgres:
	docker build --rm -t bugagazavr/postgresql:9.3 ./services/postgres/postgres-9.3
	docker build --rm -t bugagazavr/postgresql:9.1 ./services/postgres/postgres-9.1

memcached:
	docker build --rm -t bugagazavr/memcached:1.4 ./services/memcached/memcached-1.4

elasticsearch:
	docker build --rm -t bugagazavr/elasticsearch:1.4.0 ./services/elasticsearch/elasticsearch-1.4.0
	docker build --rm -t bugagazavr/elasticsearch:1.0.0 ./services/elasticsearch/elasticsearch-1.0.0

redis:
	docker build --rm -t bugagazavr/redis:2.8 ./services/redis/redis-2.8
	docker build --rm -t bugagazavr/redis:2.6 ./services/redis/redis-2.6

