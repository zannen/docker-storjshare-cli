The Storj Share Daemon+CLI (https://github.com/Storj/storjshare-daemon).

## Build ##

This image is built automatically every 8 hours, at 07:15, 15:15 and 23:15 (all times UTC), and whenever anything gets pushed to github. Pull the latest with:

```bash
docker pull oreandawe/storjshare-cli:latest
```

## Local Build ##

Alternatively, build the container locally:

```bash
cd /path/to/your/buildarea
git clone https://github.com/zannen/docker-storjshare-cli
docker build -t oreandawe/storjshare-cli:latest docker-storjshare-cli/
```

## Run Daemon ##

Start the daemon by using this command (optional args shown in square brackets with default values):

```bash
docker run --detach \
    --name mystorjdaemon \
    --restart=always \
    -v /path/to/storjdata:/storj \
    -p 4000-4003:4000-4003 \
	-e WALLET_ADDRESS=your_ERC20_wallet_address \
	[-e DAEMONADDRESS=127.0.0.1] \
	[-e DATADIR=/storj] \
	[-e SHARE_SIZE=1TB] \
	[-e RPCADDRESS=0.0.0.0] \
	[-e RPCPORT=4000] \
	[-e TUNNELING_REQUIRED=TRUE] \
	[-e STORJ_MONITOR_API_KEY=your_storjstat_com_api_key] \
	[-e USE_HOSTNAME_SUFFIX=FALSE] \
    oreandawe/storjshare-cli:latest
```

## Tunneling / port forwarding ##

If your Storj Docker container runs behind a firewall (e.g. a home router) and the `RPCPORT` port is not forwarded via a "Port forwarding", tunnelung is required in order for the clients to connect to your Storj Docker container. If you have configured a port forwarding, set `TUNNELING_REQUIRED` to `FALSE` so no tunneling will be activated and the traffic from the clients will be directly routed to your Storj instance.

## StorjStat / StorjMonitor support ##

StorjStat is a free community made tool for monitoring your Storj farming node(s), the tool gives you both real-time and historical analysis. See [storjstat.com](https://storjstat.com) and [calxibe/StorjMonitor](https://github.com/calxibe/StorjMonitor) for more information. The StorjStat API is optionally supported by using the `STORJ_MONITOR_API_KEY` environment variable when starting the `storjshare-cli` Docker container.

## Status ##

Check the status of the daemon by using this command:

```
docker exec mystorjdaemon storjshare status
```

The output should look something like this:

```
┌─────────────────────────────────────────────┬─────────┬──────────┬──────────┬─────────┬───────────────┬─────────┬──────────┬───────────┬──────────────┐
│ Share                                       │ Status  │ Uptime   │ Restarts │ Peers   │ Allocs        │ Delta   │ Port     │ Shared    │ Bridges      │
├─────────────────────────────────────────────┼─────────┼──────────┼──────────┼─────────┼───────────────┼─────────┼──────────┼───────────┼──────────────┤
│ abcdefabcdefabcdefabcdefabcdefabcdefabcd    │ running │ 4d 22h … │ 0        │ 243     │ 30            │ 20ms    │ 1234     │ 15.00MB   │ connected    │
│   → /storj/share                            │         │          │          │         │ 15 received   │         │ (Tunnel) │ (1%)      │              │
└─────────────────────────────────────────────┴─────────┴──────────┴──────────┴─────────┴───────────────┴─────────┴──────────┴───────────┴──────────────┘
```

## Stop Daemon ##

Stop the daemon by using these commands:

```
docker stop mystorjdaemon
docker rm mystorjdaemon
```

## Versions ##

Check versions for `npm`, `node` and `storjshare` with:

```
docker run --rm -ti --entrypoint /versions oreandawe/storjshare-cli:latest
node version:
v6.7.0

npm version:
{ npm: '3.10.3',
  ares: '1.10.1-DEV',
  http_parser: '2.7.0',
  icu: '57.1',
  modules: '48',
  node: '6.7.0',
  openssl: '1.0.2k',
  uv: '1.9.1',
  v8: '5.1.281.83',
  zlib: '1.2.11' }

storjshare version:
daemon: 5.3.0, core: 8.5.0, protocol: 1.2.0
```

Or run an interactive shell:

```
docker run --rm -ti --entrypoint /bin/sh oreandawe/storjshare-cli
```

Or connect to an existing container:

```
docker exec -ti nameofyourcontainer /bin/sh
```

## Troubleshooting ##

* `exec format error` - The architecture of the program does not match the hardware architecture. The `latest` tag is built on `x86_64`, and there is an `armv6l` tag for Raspberry Pi hardware.
