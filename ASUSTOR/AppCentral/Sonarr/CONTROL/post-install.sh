#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Sonarr
IMAGE=linuxserver/sonarr
HTTP=1113:8989
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
--restart $RESTART \
--network=container:"NordVPN" \
--volume /volume1/Docker/$CONTENEUR:/config \
--volume /volume1/Docker/$CONTENEUR/tv:/tv \
--volume /volume1/Download:/downloads \
--volume /volume1/Music:/Music \
--volume /volume1/Video:/Video \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
$IMAGE:latest

# --net=bridge \
# --hostname $CONTENEUR \
# --publish $HTTP \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
