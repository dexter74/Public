#!/bin/sh
##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=qBittorrent
WEBUI=1007
MEMORY=512m
IMAGE=linuxserver/qbittorrent

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--net=host \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /volume1/Video:/Video \
--volume /volume1/Download:/Download \
--env PUID=0 \
--env PGID=0 \
--env TZ=Europe\Paris \
--env WEBUI_PORT=8080 \
--publish $WEBUI:8080 \
--publish 6881:6881 \
--publish 6881:6881/udp \
--restart unless-stopped \
--label cacher="oui" \
$IMAGE:latest

# --memory="$MEMORY" \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
