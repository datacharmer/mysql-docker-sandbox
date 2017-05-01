FROM ubuntu:14.04
#FROM debian:jessie

MAINTAINER Giuseppe Maxia <gmax@cpan.org>

RUN groupadd -r msandbox \
    && useradd -m -s /bin/bash -g msandbox msandbox 

RUN mkdir /docker-entrypoint-initdb.d 

RUN apt-get update \
    && apt-get install -y make sudo libaio1 vim-tiny perl-modules libnuma1 binutils \
    && rm -rf /var/lib/apt/lists/* \
    && echo "msandbox    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && mkdir /opt/mysql \
    && export USER=root \
    && yes | cpan -T MySQL::Sandbox \
    && rm -rf /root/.cpan

USER msandbox
WORKDIR /home/msandbox
RUN mkdir /home/msandbox/opt && ln -s /opt/mysql /home/msandbox/opt/mysql

ENV USER=msandbox
