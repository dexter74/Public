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
--dns="8.8.8.8" \
--env PUID=0 \
--env PGID=0 \
--env TZ=Europe\Paris \
--env WEBUI_PORT=1007 \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /volume1/Video:/Video \
--volume /volume1/Download:/downloads \
--publish $WEBUI:1007 \
--publish 6881:6881 \
--publish 6881:6881/udp \
--restart unless-stopped \
--label cacher="oui" \
$IMAGE

# --memory="$MEMORY" \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
