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
--restart unless-stopped \
--net=bridge \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/config \
--env TZ="Europe/Paris" \
--env PASSWORD="password" \
--env HASHED_PASSWORD="6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e" \
--env SUDO_PASSWORD="admin" \
--env SUDO_PASSWORD_HASH="fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" \
--env PROXY_DOMAIN="" \
--env  DEFAULT_WORKSPACE="/config/workspace" \
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