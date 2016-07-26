FROM        debian:jessie
MAINTAINER  Jim Myhrberg "contact@jimeh.me"

RUN apt-get update -y && apt-get -y install build-essential libssl-dev libperl-dev pkg-config

ARG ZNC_VERSION=1.6.3
ADD http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz /src/

WORKDIR /src/
RUN tar -zxf "znc-${ZNC_VERSION}.tar.gz" \
 && cd znc-${ZNC_VERSION} && ./configure && make && make install \
 && useradd znc

ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
