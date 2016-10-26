docker-csgo
---

Yet another docker container that will give you a fairly quick CS:GO install.
It's not much good for anything other than LAN play, but you could easily
tweak the configuration to allow for an authenticated server.

Building the container
---

* Clone the repo
* Switch to the repo directory - `cd docker-csgo`
* Build the container - `docker build -t csgo .`

Running the container
---

As the container doesn't actually have the CS:GO files contained within
due to the overall size, the first launch of the container will take a 
bit of time depending on your internet connection.  As long as you 
properly supply a local volume then the files should just get updated 
if necessary on any additional restarts.

I've included a script `run.sh` with some defaults but you will want
to update your passwords.

```shell
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
```
