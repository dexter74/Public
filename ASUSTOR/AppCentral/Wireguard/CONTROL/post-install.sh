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
echo "net.ipv4.ip_forward=1
net.ipv4.conf.eth1.mc_forwarding=1
net.ipv4.conf.eth1.bc_forwarding=1" >> /etc/sysctl.conf;
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
--sysctl net.ipv4.conf.all.src_valid_mark=1 \
--volume /etc/wireguard/wg0.conf:/config/wg0.conf \
--publish $PORT \
$IMAGE:latest

#--volume /etc/sysctl.conf:/etc/sysctl.conf \
#--volume /sys/module/wireguard:/lib/modules \
#--volume /usr/local/AppCentral/adm-kernel-extensions/lib/:/lib/modules \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
