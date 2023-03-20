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
# Prise en charge du Forwading #
################################
# Default
echo "net.ipv4.neigh.default.gc_thresh1 = 512
net.ipv4.neigh.default.gc_thresh2 = 2048
net.ipv4.neigh.default.gc_thresh3 = 4096" > /etc/sysctl.conf;
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf;
sysctl -p;



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
--volume /sys/module/wireguard:/lib/modules \
--volume /etc/wireguard/wg0.conf:/config/wg0.conf \
--publish $PORT \
$IMAGE:latest



##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
