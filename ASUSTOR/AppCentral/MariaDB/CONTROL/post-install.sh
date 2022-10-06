#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=MariaDB
HTTP=3306:3306
IMAGE=linuxserver/mariadb

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart unless-stopped \
--net=host \
--hostname $CONTENEUR \
--env TZ="Europe/Paris" \
--env MYSQL_ROOT_PASSWORD="root" \
--env MYSQL_DATABASE="mysql" \
--env MYSQL_PASSWORD="username" \
--env MYSQL_USER="password" \
--volume /volume1/Docker/$CONTENEUR:/config \
--publish $HTTP \
--label cacher="oui" \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0