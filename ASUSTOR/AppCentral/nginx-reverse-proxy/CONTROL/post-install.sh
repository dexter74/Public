#!/bin/sh

##########################################################################################################################################################
# docker logs $CONTENEUR
# docker exec -it $CONTENEUR /bin/bash

# http://192.168.1.2:81
# admin@example.com | changeme



##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
#CONTENEUR=ReverseProxy
#HTTP=8080:8080
#HTTPS=1443:443
#WEBUI=81:81
#IMAGE=jc21/nginx-proxy-manager:latest

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
#docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
#docker run -d \
#--name=$CONTENEUR \
#--restart unless-stopped \
#--net=host \
#--hostname $CONTENEUR \
#--volume /volume1/Docker/$CONTENEUR:/data \
#--volume /volume1/Docker/LetsEncrypt:/etc/letsencrypt \
#--env DB_MYSQL_HOST="127.0.0.1" \
#--env DB_MYSQL_PORT="3306" \
#--env DB_MYSQL_NAME="database" \
#--env DB_MYSQL_USER="username" \
#--env DB_MYSQL_PASSWORD="password" \
#--publish $HTTP \
#--publish $HTTPS \
#--publish $WEBUI \
#--label cacher="oui" \
#$IMAGE

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
#docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0