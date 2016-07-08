The Storj Share CLI (https://github.com/Storj/storjshare-cli).

## Build ##

This image is built automatically every 8 hours, at 07:15, 15:15 and 23:15 (all times UTC), and whenever anything gets pushed to github.

## Setup ##

First, run it interactively to set things up:

    bash$ docker run --rm -ti --name storjshare \
        -v /path/to/storjshare:/storjshare \
        oreandawe/storjshare-cli:latest
    
    (lots of questions...)

Notes:

* Specify `/storjshare/data` for the path to store configuration and data, and `/storjshare/id_ecdsa` for the path to store the key. The directory `/path/to/storjshare` on the host appears as `/storjshare` inside the container.
* Choose a long random password, and don't make it the same as any other password used elsewhere, because the password is easy to find by anyone who has login access to the host where the container is being run:
      bash$ docker inspect storjshare | jq '.[0].Args'
      bash$ ps -ef | grep storjshare

## Running ##

After setup, run the app in the background:

    bash$ docker run -d --name storjshare \
        -v /path/to/storjshare:/storjshare \
        --restart=always \
        oreandawe/storjshare-cli:latest start \
        --datadir /storjshare/data \
        --password somepassword

## Versions ##

Check versions for `npm`, `node` and `storjshare` with:

    bash$ docker run --rm -ti --entrypoint /versions oreandawe/storjshare-cli
    node version:
    v4.3.0

    npm version:
    { npm: '2.14.12',
      ares: '1.10.1-DEV',
      http_parser: '2.5.1',
      modules: '46',
      node: '4.3.0',
      openssl: '1.0.2f',
      uv: '1.7.5',
      v8: '4.5.103.35',
      zlib: '1.2.8' }

    storjshare version:
    StorjShare: 4.0.4
    Core:       1.3.6
    Protocol:   0.7.0

Or run an interactive shell:

    bash$ docker run --rm -ti --entrypoint /bin/sh oreandawe/storjshare-cli

Or connect to an existing container:

    bash$ docker exec -ti nameofyourcontainer /bin/sh
