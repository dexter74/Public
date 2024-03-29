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
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--hostname $CONTENEUR \
--net=bridge \
--dns 8.8.8.8 \
--env LOG_LEVEL=info \
--env LOG_HTML=false \
--env CAPTCHA_SOLVER=none \
--publish $HTTP \
$IMAGE:latest

# --network=container:"NordVPN" \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
