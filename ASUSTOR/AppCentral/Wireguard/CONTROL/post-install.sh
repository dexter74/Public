#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=wireguard
IMAGE=linuxserver/wireguard
HTTP=51820:51820

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
--net=host \
--cap-add="NET_ADMIN" \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/config \
--publish $HTTP \
--label cacher="oui" \
$IMAGE:latest

# --cap-add="SYS_MODULE" \
#--env \



##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0