#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Jackett
IMAGE=linuxserver/jackett
HTTP=1111:9117
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
--hostname $CONTENEUR \
--env AUTO_UPDATE="true" \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
--volume /volume1/Docker:/config \
--publish $HTTP \
--label cacher="oui" \
$IMAGE:latest

# --net=bridge \
# --dns 8.8.8.8 \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
