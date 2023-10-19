#!/bin/sh

##########################################################################################################################################################
# Conflit avec Nginx Reverse Proxy en mode HOST #
#################################################

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=AdGuardHome
IMAGE=adguard/adguardhome
RESTART=unless-stopped

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--hostname $CONTENEUR \
--net=bridge \
--restart $RESTART \
--env TZ="Europe/Paris" \
--volume /usr/builtin/etc/certificate:/sslcerts/:ro \
--volume /etc/localtime:/etc/localtime:ro \
--volume /volume1/Docker/mkcert:/cert \
--volume /volume1/Docker/$CONTENEUR/conf:/opt/adguardhome/conf \
--volume /volume1/Docker/$CONTENEUR/work:/opt/adguardhome/work \
--volume /volume1/Docker/mkcert:/cert \
--publish 53:53/udp     \
--publish 53:53/tcp     \
--publish 3000:3000/tcp \
--publish 3272:80       \
$IMAGE:latest;

#--publish 9000:80/tcp   \
#--publish 443:443/tcp   \
#--publish 443:443/udp   \

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
