The Storj Farmer (https://github.com/Storj/farmer).

## Build ##

This image is built automatically every day at **23:15 UTC** (and whenever anything gets pushed to github) from the code that is available via `npm install`.

## Setup ##

First, run it interactively to set things up:

    bash$ docker run --rm -ti --name farmer \
        -v /path/to/storjfarmdata:/data \
        oreandawe/storj-farmer:latest
    
    Let's setup your Storj configuration!
    
    STORJ-FARMER-CLI >> (lots of questions...)
    
    {"type":"info","message":... (lots of log messages)

Press Ctrl-C to kill the app once the log messages start appearing.

Notes:

* Specify `/data` for the path to store configuration and data, and `/data/id_ecdsa` for the path to store the key. The directory `/path/to/storjfarmdata` on the host appears as `/data` inside the container.
* Choose a long random password, and don't make it the same as any other password used elsewhere, because the password is easy to find by anyone who has login access to the host where the container is being run:
      bash$ docker inspect farmer | jq '.[0].Args'
      bash$ ps -ef | grep storjfarm

## Running ##

After setup, run the app in the background:

    bash$ docker run -d --name farmer \
        -v /path/to/storjfarmdata:/data \
        --restart=always \
        oreandawe/storj-farmer:latest \
        --datadir /data \
        --password somepassword

## Versions ##

Check versions for `npm`, `node` and `storjfarm` with:

    bash$ docker run --rm -ti --entrypoint /versions oreandawe/storj-farmer
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

    Storj farmer version:
    Farmer: v2.2.3
    Core:   v0.6.3

Or run an interactive shell:

    bash$ docker run --rm -ti --entrypoint /bin/sh oreandawe/storj-farmer

Or connect to an existing container:

    bash$ docker exec -ti nameofyourcontainer /bin/sh
