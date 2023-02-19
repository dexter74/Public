#!/bin/sh
##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Jellyfin
IMAGE=linuxserver/jellyfin
HTTP=8097:8096
RESTART=unless-stopped

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name $CONTENEUR \
--hostname $CONTENEUR \
--net=bridge \
--restart $RESTART \
--volume /share/Docker/:/config \
--volume /share/Download:/Download \
--volume /share/Video:/Video \
--volume /share/Music:/Music \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
--device /dev/dri/card0:/dev/dri/card0 \
--env UID=1000 \
--env GID=100 \
--publish $HTTP \
--label cacher="oui" \
$IMAGE

# --env UID=1000 \ # The UID to run emby as (default: 2)
# --env GID=100 \ # The GID to run emby as (default 2)
# --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
 
##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
