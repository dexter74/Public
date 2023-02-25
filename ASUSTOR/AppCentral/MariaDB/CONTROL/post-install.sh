#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=MariaDB
PORT=3306:3306
IMAGE=linuxserver/mariadb
RESTART=unless-stopped
SQL="https://raw.githubusercontent.com/dexter74/Public/main/ASUSTOR/AppCentral/MariaDB/CONTROL/requet.sql"
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
--env MYSQL_ROOT_PASSWORD="root" \
--env MYSQL_DATABASE="database" \
--env MYSQL_USER="username" \
--env MYSQL_PASSWORD="password" \
--env REMOTE_SQL="$SQL" \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
--volume /volume1/Docker/$CONTENEUR:/config \
--publish $PORT \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
