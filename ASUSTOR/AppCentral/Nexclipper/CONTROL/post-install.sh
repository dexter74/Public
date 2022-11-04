#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=NexClipper
IMAGE=nexclipper/nexclipper
HTTP=10051:9001

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart no \
--net=bridge \
--hostname $CONTENEUR \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume /var/lib/docker:/var/lib/docker \
--publish $HTTP \
--label cacher="oui" \
$IMAGE:latest


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
