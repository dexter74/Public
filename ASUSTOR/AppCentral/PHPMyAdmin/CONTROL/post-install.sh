#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR='phpMyAdmin'
IMAGE='phpmyadmin/phpmyadmin'
PORT='8888:80'
MYSQL_HOST='127.0.0.1'
MYSQL_PORT='3306'
MYSQL_USER='username'
MYSQL_PASS='password'
PHPMYADMIN_DATABASE='phpmyadmin'

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name $CONTENEUR \
--restart unless-stopped \
--net=bridge \
--hostname $CONTENEUR \
--env PMA_ARBITRARY="1" \
--env PMA_HOST="$MYSQL_HOST" \
--env PMA_PORT="$MYSQL_PORT" \
--env PMA_USER="$MYSQL_USER" \
--env PMA_PASSWORD="$MYSQL_PASS" \
--env PMA_PMADB="$PHPMYADMIN_DATABASE" \
--publish $PORT \
--label cacher="oui" \
$IMAGE







##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

