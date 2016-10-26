#!/bin/bash

docker run -it \
  -e TICK_RATE=128 \
  -e MAP=de_dust2 \
  -e SERVERCFGFILE=server.cfg \
  -e MAXPLAYERS_OVERRIDE=12 \
  -e GAME_MODE=1 \
  -e GAME_TYPE=0 \
  -e SERVER_NAME="your server name" \
  -e RCON_PASSWORD="yourpassword" \
  -e SV_PASSWORD="yourotherpassword" \
  -p 27005:27005/udp \
  -p 27015:27015 \
  -p 27015:27015/udp \
  -p 27020:27020/udp \
  -v /archive/docker/volumes/csgo/steam:/home/steam \
  --name csgo csgo:latest
