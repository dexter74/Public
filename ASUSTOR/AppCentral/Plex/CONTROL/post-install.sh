#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Plex
IMAGE=linuxserver/plex
HTTP=32400:32400
IP_NAS=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart no \
--net=bridge \
--hostname $CONTENEUR \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=1000 \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /share/Download:/Download \
--volume /share/Music:/Music \
--volume /share/Video:/Video \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
--device /dev/dri/card0:/dev/dri/card0 \
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
