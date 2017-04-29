The Storj Share Daemon+CLI (https://github.com/Storj/storjshare-daemon).

## Build ##

This image is built automatically every 8 hours, at 07:15, 15:15 and 23:15 (all times UTC), and whenever anything gets pushed to github. Pull the latest with:

    shell$ docker pull oreandawe/storjshare-cli:latest

## Local Build ##

Alternatively, build the container locally:

    shell$ cd /path/to/your/buildarea
    shell$ git clone https://github.com/zannen/docker-storjshare-cli
    shell$ docker build -t oreandawe/storjshare-cli docker-storjshare-cli/

## Versions ##

Check versions for `npm`, `node` and `storjshare` with:

    shell$ docker run --rm -ti --entrypoint /versions oreandawe/storjshare-cli
    node version:
    v6.7.0

    npm version:
    { npm: '3.10.3',
      ares: '1.10.1-DEV',
      http_parser: '2.7.0',
      icu: '57.1',
      modules: '48',
      node: '6.7.0',
      openssl: '1.0.2j',
      uv: '1.9.1',
      v8: '5.1.281.83',
      zlib: '1.2.8' }

    storjshare version:
    Secp256k1 bindings are not compiled. Pure JS implementation will be used.
    * daemon: 2.5.1, core: 6.4.2, protocol: 1.1.0

Or run an interactive shell:

    shell$ docker run --rm -ti --entrypoint /bin/sh oreandawe/storjshare-cli

Or connect to an existing container:

    shell$ docker exec -ti nameofyourcontainer /bin/sh
