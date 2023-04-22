#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR='phpMyAdmin'
IMAGE='phpmyadmin/phpmyadmin'
PORT='8081:80'
RESTART=unless-stopped
MYSQL_HOST=$(ip add | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASS='root'
PHPMYADMIN_DATABASE='phpmyadmin'

##########################################################################################################################################################
# Suppression du Conteneur #
############################
docker container rm -f $CONTENEUR;

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
--publish $PORT \
$IMAGE

#--volume /share/Docker/$CONTENEUR:/etc/phpmyadmin/ \


##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
