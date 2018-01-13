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

Start the daemon by using this command:

```bash
docker run --detach \
    --name mystorjdaemon \
    --restart=always \
    -v /path/to/storjdata:/storj \
    -p 4000-4003:4000-4003 \
    oreandawe/storjshare-cli:latest
```

If the Storj config file (`config.json`) needs to be created:

```bash
docker exec -ti mystorjdaemon storjshare-create \
    --storj [YourERC20Address] \
    --storage /storj/data \
    --size [YourSize] \
    --rpcport 4000 \
    --logdir /storj/logdir \
    --outfile /storj/config.json \
    --noedit
```

## Stop Daemon ##

Stop the daemon by using these commands:

```bash
docker stop mystorjdaemon
docker rm mystorjdaemon
```

## Versions ##

Check versions for `npm`, `node` and `storjshare` with:

```bash
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

```bash
docker run --rm -ti --entrypoint /bin/sh oreandawe/storjshare-cli
```

Or connect to an existing container:

```bash
docker exec -ti nameofyourcontainer /bin/sh
```
