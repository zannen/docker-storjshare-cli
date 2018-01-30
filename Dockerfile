FROM gliderlabs/alpine:3.4
ENV MAKEFLAGS -j8
RUN \
	apk add --no-cache g++ gcc git make nodejs python && \
	npm install -g storjshare-daemon && \
	apk del --no-cache g++ gcc git make
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare", "daemon", "-F"]
