FROM bugagazavr/openjdk:1.7

WORKDIR /home/ubuntu
USER ubuntu

RUN wget -O /tmp/sbt.deb https://dl.bintray.com/sbt/debian/sbt-0.13.6.deb
RUN sudo dpkg -i /tmp/sbt.deb
RUN rm -f /tmp/sbt.deb
RUN sbt