#!/bin/sh

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
--net=host \
--restart $RESTART \
--subnet=192.168.0.0/24 \
--env TZ="Europe/Paris" \
--volume /usr/builtin/etc/certificate:/sslcerts/:ro \
--volume /etc/localtime:/etc/localtime:ro \
--volume /volume1/Docker/$CONTENEUR/conf:/opt/adguardhome/conf \
--volume /volume1/Docker/$CONTENEUR/work:/opt/adguardhome/work \
--publish 3000:3000 \
--publish 3272:80 \
$IMAGE:latest


##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
