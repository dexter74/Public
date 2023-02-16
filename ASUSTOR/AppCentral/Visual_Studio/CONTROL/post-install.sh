#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=CodeServer
HTTP=8443:8443
IMAGE=linuxserver/code-server

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
--volume /volume1/Docker/$CONTENEUR:/config \
--env PASSWORD="password" \
--env SUDO_PASSWORD="admin" \
--env PROXY_DOMAIN="" \
--env DEFAULT_WORKSPACE="/config/workspace" \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=1000 \
--publish $HTTP \
--label cacher="oui" \
$IMAGE




##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
