FROM gliderlabs/alpine:3.4
RUN apk add --no-cache nodejs
RUN \
	apk add --no-cache g++ gcc git make bash python && \
	export MAKEFLAGS=-j8 && \
	npm install -g storjshare-daemon && \
	npm cache clear --force && \
	apk del --no-cache g++ gcc git make bash python
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare", "daemon", "-F"]
