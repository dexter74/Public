#!/bin/sh
##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Jellyfin
IMAGE=linuxserver/jellyfin
HTTP=8097:8096
HTTPS=8921:8920
RESTART=unless-stopped
IP_NAS=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name $CONTENEUR \
--hostname $CONTENEUR \
--net=bridge \
--restart $RESTART \
--volume /share/Docker/:/config \
--volume /share/Download:/Download \
--volume /share/Video:/Video \
--volume /share/Music:/Music \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
--device /dev/dri/card0:/dev/dri/card0 \
--env JELLYFIN_PublishedServerUrl=$IP_NAS \
--env TZ=	Europe/Paris \
--env UID=1000 \
--env GID=100 \
--publish $HTTP \
--publish $HTTPS \
--label cacher="oui" \
$IMAGE

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
