#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Adminer
IMAGE=adminer
PORT=1118:8080
RESTART=unless-stopped
SERVER=$(ip add show eth1 | grep inet  | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--net=bridge \
--hostname $CONTENEUR \
--restart $RESTART \
--env ADMINER_DEFAULT_SERVER=$SERVER \
--publish $PORT \
$IMAGE:latest

#--volume /volume1/Docker/$CONTENEUR:/config \
#--env ADMINER_PLUGINS='' \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
