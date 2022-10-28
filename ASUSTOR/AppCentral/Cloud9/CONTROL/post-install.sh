#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Cloud9
IMAGE=linuxserver/cloud9
HTTP=1000:8000
WEBUI_USER=admin
WEBUI_PASS=admin
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
--restart always \
--net=bridge \
--env TZ="Europe/Paris" \
--env USERNAME="$WEBUI_USER" \
--env PASSWORD="$WEBUI_PASS" \
--publish $HTTP \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/code \
--volume /var/run/docker.sock:/var/run/docker.sock \
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
