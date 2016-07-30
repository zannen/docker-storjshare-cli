FROM gliderlabs/alpine:3.4
RUN apk update && \
    apk add g++ gcc git make nodejs python && \
    npm install -g storjshare-cli && \
    rm -rf /var/cache/apk/*
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare"]
