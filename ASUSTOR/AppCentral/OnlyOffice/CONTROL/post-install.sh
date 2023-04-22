#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=OnlyOffice
IMAGE=onlyoffice/documentserver
HTTP=1121
RESTART=unless-stopped
IP_NAS=$(ip add | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=host \
--hostname $CONTENEUR \
--env JWT_SECRET="admin" \
--volume /volume1/Docker/$CONTENEUR/logs:/var/log/onlyoffice       \
--volume /volume1/Docker/$CONTENEUR/Data:/var/www/onlyoffice/Data  \
--volume /volume1/Docker/$CONTENEUR/Database:/var/lib/postgresql   \
--volume /volume1/Docker/$CONTENEUR/Cache:/var/lib/onlyoffice      \
--publish $HTTP:8000 \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
