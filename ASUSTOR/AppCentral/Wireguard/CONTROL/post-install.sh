#!/bin/sh

##############################################################################################################################
# Wireguard sous Docker #
#########################
CONTENEUR=wireguard
RESTART=unless-stopped
PORT=51820
IMAGE=linuxserver/wireguard
#
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
--volume /sys/module/wireguard::/lib/modules \
--publish $PORT \
$IMAGE:latest


# --volume /etc/wireguard/wg0.conf:/config/wg0.conf \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
