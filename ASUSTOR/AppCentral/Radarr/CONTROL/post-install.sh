#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Radarr
IMAGE=linuxserver/radarr
HTTP=1112:7878
RESTART=unless-stopped

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--network=container:"NordVPN" \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /volume1/Download:/downloads \
--volume /volume1/Music:/Music \
--volume /volume1/Video:/Video \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
--publish $HTTP \
$IMAGE:latest


# --restart $RESTART \
# --net=bridge \
# --hostname $CONTENEUR \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
