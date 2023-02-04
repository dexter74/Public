#!/bin/sh
##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Emby
IMAGE=emby/embyserver
HTTP=8096:8096
HTTPS=8920:8920
RESTART=unless-stopped

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d --name $CONTENEUR \
--restart $RESTART \
--volume /share/Docker/Emby:/config \
--volume /share/Download:/Download \
--volume /share/Video:/Video \
--volume /share/Music:/Music \
--net=bridge \
--publish $HTTP \
--publish $HTTPS \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
--device /dev/dri/card0:/dev/dri/card0 \
--label cacher="oui" \
$IMAGE

# --env UID=1000 \ # The UID to run emby as (default: 2)
# --env GID=100 \ # The GID to run emby as (default 2)
# --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
 
##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

