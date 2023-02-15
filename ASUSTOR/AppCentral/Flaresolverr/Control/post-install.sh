#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Flaresolverr
IMAGE=ghcr.io/flaresolverr/flaresolverr
HTTP=1115:8191
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
--hostname $CONTENEUR \
--dns 8.8.8.8 \
--env LOG_LEVEL=${LOG_LEVEL:-info} \
--env LOG_HTML=${LOG_HTML:-false} \
--env CAPTCHA_SOLVER=${CAPTCHA_SOLVER:-none} \
--publish $HTTP \
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
