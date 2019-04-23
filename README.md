# dero-docker
Dockerfile for dero


# Building

```bash
docker build -t dero .
```

# Running

```bash
# block and wallet dir
mkdir derodata
# first time, you need to create a wallet interactively
docker run --rm -it --name idero -p 20206:20206 -p 20209:20209 -v `pwd`/derodata:/opt/coin dero
# later, you can use `docker run --rm -itd ...`
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/dero/>:

```bash
docker run --rm -itd --name idero -p 20206:20206 -p 20209:20209 -v `pwd`/data:/opt/coin  mixhq/dero
```

# Quick Sync
See <https://github.com/deroproject/wiki/wiki/Run-Dero-Full-Node>

1. Place `http://seeds.dero.io/blockchain/derod_database.db` in `derodata/data/mainnet/` (blocks dir)
2. Start node
