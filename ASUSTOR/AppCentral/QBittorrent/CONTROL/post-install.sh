#!/bin/sh
##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=qBittorrent
PORT=6881:6881
WEBUI=1110:1007
MEMORY=512m
IMAGE=linuxserver/qbittorrent
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
--net=bridge \
--hostname $CONTENEUR \
--sysctl net.ipv6.conf.all.disable_ipv6=1 \
--dns 8.8.8.8 \
--env PUID=1000 \
--env PGID=100 \
--env TZ=Europe\Paris \
--env WEBUI_PORT=1007 \
--volume /volume1/Docker/:/config \
--volume /volume1/Download:/downloads \
--volume /volume1/Music:/Music \
--volume /volume1/Video:/Video \
--publish $PORT \
--publish $WEBUI \
$IMAGE:latest

#--network=container:"NordVPN" \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Correctif Accès #
###################
docker stop $CONTENEUR;
cat "/volume1/.@plugins/AppCentral/qBittorrent/CONTROL/qBittorrent.conf" > "/share/Docker/qBittorrent/qBittorrent.conf";
sleep 3;
docker start $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
