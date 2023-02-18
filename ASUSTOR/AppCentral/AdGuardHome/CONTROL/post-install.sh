#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=AdGuardHome
IMAGE=adguard/adguardhome
RESTART=unless-stopped
WEBUI=3272
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
--restart $RESTART \
--env TZ="Europe/Paris" \
--volume /usr/builtin/etc/certificate:/sslcerts/:ro \
--volume /etc/localtime:/etc/localtime:ro \
--volume /volume1/Docker/$CONTENEUR/conf:/opt/adguardhome/conf \
--volume /volume1/Docker/$CONTENEUR/work:/opt/adguardhome/work \
--publish 53:53/tcp     \
--publish 53:53/udp     \
--publish 80:80/tcp     \
--publish 443:443/tcp   \
--publish 443:443/udp   \
--publish $WEBUI:3000/tcp \
$IMAGE:latest


# --net=host \

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
