#!/bin/sh
##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=qBittorrent
PORT=6881:6881
WEBUI=1007
MEMORY=512m
IMAGE=linuxserver/qbittorrent
RESTART=unless-stopped

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--dns="8.8.8.8" \
--env PUID=0 \
--env PGID=0 \
--env TZ=Europe\Paris \
--env WEBUI_PORT=1007 \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /volume1/Video:/Video \
--volume /volume1/Download:/downloads \
--publish $WEBUI:1007 \
--publish $PORT \
--label cacher="oui" \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
