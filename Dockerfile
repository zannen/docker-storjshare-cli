FROM gliderlabs/alpine:3.4
RUN \
	apk add --no-cache bash g++ gcc git make nodejs python && \
	export MAKEFLAGS=-j8 && \
	npm install -g storjshare-daemon && \
	git clone https://github.com/calxibe/StorjMonitor.git /opt/StorjMonitor && \
	chmod +x /opt/StorjMonitor/storjMonitor.sh && \
	rm -rf /opt/StorjMonitor/node_modules && \
	npm --prefix /opt/StorjMonitor/ install && \
	npm cache clear --force && \
	apk del --no-cache g++ gcc git make python

ENV USE_HOSTNAME_SUFFIX=FALSE
ENV DATADIR=/storj
ENV WALLET_ADDRESS=
ENV SHARE_SIZE=1TB
ENV RPCADDRESS=0.0.0.0
ENV RPCPORT=4000
ENV DAEMONADDRESS=127.0.0.1
ENV TUNNELING_REQUIRED=TRUE
ENV STORJ_MONITOR_API_KEY=
EXPOSE 4000-4003/tcp

ADD versions entrypoint /
ENTRYPOINT ["/entrypoint"]
