FROM gliderlabs/alpine:3.4
ENV MAKEFLAGS -j8
RUN apk update && \
    apk add g++ gcc git make nodejs python && \
    npm install -g storjshare-daemon && \
    rm -rf /var/cache/apk/*
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare"]
