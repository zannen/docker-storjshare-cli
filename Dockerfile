FROM gliderlabs/alpine:3.4
ENV MAKEFLAGS -j8
RUN apk add --no-cache nodejs
RUN \
	apk add --no-cache g++ gcc git make bash python && \
	npm install -g storjshare-daemon && \
	npm cache clear --force && \
	apk del --no-cache g++ gcc git make bash python
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare", "daemon", "-F"]
