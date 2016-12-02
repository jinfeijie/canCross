FROM alpine:latest
MAINTAINER mrjin<me@jinfeijie.cn>

WORKDIR /

ENV SS_VER=2.5.6
ENV SS_URL=https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8888
ENV PASSWORD    jin123
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8
ENV DNS_ADDR_2  8.8.4.4

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                asciidoc \
                                autoconf \
                                build-base \
                                curl \
                                libtool \
                                linux-headers \
                                openssl-dev \
                                pcre-dev \
                                tar \
                                xmlto && \
    cd /tmp && \
    curl -sSL $SS_URL | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    cd .. && \

    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/* && \
    mv /usr/bin/ss-server /usr/bin/ssserver

USER nobody

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ssserver -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k ${PASSWORD:-$(hostname)} \
              -m $METHOD \
              -t $TIMEOUT \
              --fast-open \
              -d $DNS_ADDR \
              -d $DNS_ADDR_2 \
              -u
