#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
IMAGE="vishnunair/docker-mkcert"
CONTENEUR="mkcert"
DOMAIN="bitwarden.local dns.local torrent.local"
RESTART=unless-stopped
IP_NAS=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)

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
