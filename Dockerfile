FROM alpine:edge

RUN apk add --update znc znc-dev znc-extra

ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default \
	    && mkdir /znc-data && chgrp root /znc-data && chmod g+w /znc-data


VOLUME ["/znc-data"]

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
