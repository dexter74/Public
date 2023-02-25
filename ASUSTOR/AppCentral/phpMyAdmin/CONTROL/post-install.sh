#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR='phpMyAdmin'
IMAGE='phpmyadmin/phpmyadmin'
PORT='8081:80'
RESTART=unless-stopped
MYSQL_HOST=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASS='root'
PHPMYADMIN_DATABASE='phpmyadmin'

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name $CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--env PMA_ARBITRARY="0" \
--env PMA_HOST="$MYSQL_HOST" \
--env PMA_PORT="$MYSQL_PORT" \
--env PMA_USER="$MYSQL_USER" \
--env PMA_PASSWORD="$MYSQL_PASS" \
--env PMA_PMADB="$PHPMYADMIN_DATABASE" \
--volume /share/Docker/$CONTENEUR/www:/var/www/html \
--volume /share/Docker/$CONTENEUR/cfg:/etc/phpmyadmin \
--publish $PORT \
--label cacher="oui" \
$IMAGE

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Correctif #
#############
docker exec -i $CONTENEUR bash

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
