#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=ReverseProxy
IMAGE=jc21/nginx-proxy-manager
HTTP=8080:80
HTTPS=1443:443

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d --name $CONTENEUR --volume /share/Docker/$CONTENEUR:/config --net=host --publish $HTTP --publish $HTTPS --label cacher="oui" $IMAGE

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

