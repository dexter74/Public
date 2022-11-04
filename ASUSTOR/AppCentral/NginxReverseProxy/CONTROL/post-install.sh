#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=ReverseProxy
IMAGE=jc21/nginx-proxy-manager
MYSQL_HOST=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT='3306'
MYSQL_DB='database'
MYSQL_USER='username'
MYSQL_PASS='password'
PHPMYADMIN_DATABASE='phpmyadmin'

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR
PORT0=8080:80
PORT1=1443:443
PORT2=81:81
##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name $CONTENEUR \
--restart no \
--net=bridge \
--hostname $CONTENEUR \
--volume /share/Docker/$CONTENEUR:/config \
--volume /share/Docker/$CONTENEUR/LetsEncrypt:/etc/letsencrypt \
--env TZ="Europe/Paris" \
--env DB_MYSQL_HOST="$MYSQL_HOST" \
--env DB_MYSQL_PORT="$MYSQL_PORT" \
--env DB_MYSQL_NAME="$MYSQL_DB" \
--env DB_MYSQL_USER="$MYSQL_USER" \
--env DB_MYSQL_PASSWORD="$MYSQL_PASS" \
--publish $PORT0 \
--publish $PORT1 \
--publish $PORT2 \
--label cacher="oui" \
$IMAGE







##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

