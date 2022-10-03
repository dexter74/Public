#!/bin/sh

# Arrêt du Conteneur
docker stop Emby

# Lancement du Conteneur
docker run -d --name Emby \
--volume /share/Docker/Emby:/config \
--net=host \
--publish 8096:8096 \
--publish 8920:8920 \
emby/embyserver




# --env UID=1000 \ # The UID to run emby as (default: 2)
# --env GID=100 \ # The GID to run emby as (default 2)
# --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
 
