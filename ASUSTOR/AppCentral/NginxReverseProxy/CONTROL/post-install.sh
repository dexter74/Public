#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=ReverseProxy
IMAGE=jc21/nginx-proxy-manager
RESTART=unless-stopped

#MYSQL_HOST=$(ip add | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_HOST=$(ip add show eth1 | grep inet  | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT='3306'
MYSQL_DB='database'
MYSQL_USER='username'
MYSQL_PASS='password'
PORT0=8080:80
PORT1=1443:443
PORT2=81:81

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name $CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--volume /share/Docker/$CONTENEUR:/config \
--volume /share/Docker/$CONTENEUR/LetsEncrypt:/etc/letsencrypt \
--volume /share/Docker/$CONTENEUR/data:/data \
--env TZ="Europe/Paris" \
--env DB_MYSQL_HOST="$MYSQL_HOST" \
--env DB_MYSQL_PORT="$MYSQL_PORT" \
--env DB_MYSQL_NAME="$MYSQL_DB" \
--env DB_MYSQL_USER="$MYSQL_USER" \
--env DB_MYSQL_PASSWORD="$MYSQL_PASS" \
--publish $PORT0 \
--publish $PORT1 \
--publish $PORT2 \
--label cacher="non" \
$IMAGE:latest

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
