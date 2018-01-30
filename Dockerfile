FROM gliderlabs/alpine:3.4
ENV MAKEFLAGS -j8
RUN apk add --no-cache nodejs python
RUN \
	apk add --no-cache g++ gcc git make bash && \
	npm install -g storjshare-daemon && \
	npm cache clear --force && \
	apk del --no-cache g++ gcc git make bash
COPY versions /
ENTRYPOINT ["/usr/bin/storjshare", "daemon", "-F"]
