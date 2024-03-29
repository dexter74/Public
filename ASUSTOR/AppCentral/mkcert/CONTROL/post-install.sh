#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
IMAGE="vishnunair/docker-mkcert"
CONTENEUR="mkcert"
DOMAIN="asustor.local bitwarden.local dns.local dozzle.local emby.local jackett.lan nginx.local radarr.local sonarr.local torrent.local"
RESTART=no
IP_NAS=$(ip add | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR;
rm -rf /share/Docker/$CONTENEUR;

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname "$CONTENEUR" \
--env domain="$DOMAIN" \
--volume /share/Docker/$CONTENEUR:/root/.local/share/mkcert \
$IMAGE:latest;

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
