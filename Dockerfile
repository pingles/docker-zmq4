FROM ubuntu:latest
MAINTAINER Paul Ingles <paul@oobaloo.co.uk>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libc6
RUN apt-get clean && apt-get autoclean

ADD http://download.zeromq.org/zeromq-4.0.5.tar.gz /tmp/zeromq-4.0.5.tar.gz
WORKDIR /tmp
RUN tar zxvf zeromq-4.0.5.tar.gz
WORKDIR /tmp/zeromq-4.0.5

RUN ["./configure"]
RUN ["make"]
RUN ["make", "install"]
RUN ["ldconfig"]
