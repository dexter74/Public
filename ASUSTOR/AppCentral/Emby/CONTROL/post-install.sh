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
docker stop $CONTENEUR;
docker container rm $CONTENEUR;

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name $CONTENEUR \
--hostname $CONTENEUR \
--net=bridge \
--restart $RESTART \
--env UID=1000 \
--env GUID=100 \
--env GIDLIST=100 \
--volume /share/Docker/Emby:/config \
--volume /share/Download:/Download \
--volume /share/Music:/Music \
--volume /share/Video:/Video \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
--device /dev/dri/card0:/dev/dri/card0 \--publish $HTTP \
--publish $HTTPS \
--label cacher="oui" \
$IMAGE;

# --env UID=1000 \ # The UID to run emby as (default: 2)
# --env GID=100 \ # The GID to run emby as (default 2)
# --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
