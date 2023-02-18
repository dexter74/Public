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
--restart $RESTART \
--env TZ="Europe/Paris" \
--volume /usr/builtin/etc/certificate:/sslcerts/:ro \
--volume /etc/localtime:/etc/localtime:ro \
--volume /volume1/Docker/$CONTENEUR/conf:/opt/adguardhome/conf \
--volume /volume1/Docker/$CONTENEUR/work:/opt/adguardhome/work \
--publish 53:53/tcp     \
--publish 53:53/udp     \
--publish 67:67/udp     \
--publish 80:80/tcp     \
--publish 443:443/tcp   \
--publish 443:443/udp   \
--publish 3000:3000/tcp \
--publish 853:853/tcp   \
--publish 784:784/udp   \
--publish 853:853/udp   \
--publish 8853:8853/udp \
--publish 5443:5443/tcp \
--publish 5443:5443/udp \
$IMAGE:latest


# --net=host \
#--publish 68:68/udp     \


##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
