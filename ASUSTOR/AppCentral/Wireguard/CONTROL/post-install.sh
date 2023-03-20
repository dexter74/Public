#!/bin/sh

IMAGE=linuxserver/wireguard
CONTENEUR=wireguard
RESTART=unless-stopped
PORT=51820
##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR;

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--cap-add=NET_ADMIN \
--cap-add=SYS_MODULE \
--env PUID=1000 \
--env PGID=100 \
--env TZ=Etc/PARIS \
--publish $PORT \
$IMAGE:latest

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
