#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Cloud9
IMAGE=linuxserver/cloud9
HTTP=1000:8000
WEBUI_USER=admin
WEBUI_PASS=admin
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
--env USERNAME="$WEBUI_USER" \
--env PASSWORD="$WEBUI_PASS" \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
--publish $HTTP \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/code \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume "/share/User Homes":/share \
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
