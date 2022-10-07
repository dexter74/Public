#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=ReverseProxy
IMAGE=jc21/nginx-proxy-manager
PORT0=8080:80
PORT1=1443:443
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
--net=host \
--hostname $CONTENEUR \
--volume /share/Docker/$CONTENEUR:/config \
--volume /share/Docker/$CONTENEUR/LetsEncrypt:/etc/letsencrypt \
--env TZ="Europe/Paris" \
--env DB_MYSQL_HOST="127.0.0.1" \
--env DB_MYSQL_PORT="3306" \
--env DB_MYSQL_NAME="database" \
--env DB_MYSQL_USER="username" \
--env DB_MYSQL_PASSWORD="password" \
--publish $PORT0 \
--publish $PORT1 \
--label cacher="oui" \
$IMAGE


##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

