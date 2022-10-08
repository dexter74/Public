#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Dozzle
IMAGE=amir20/dozzle
HTTP=1005:8080

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart unless-stopped \
--net=bridge \
--hostname $CONTENEUR \
--volume /var/run/docker.sock:/var/run/docker.sock \
--publish $HTTP \
--label cacher="oui" \
$IMAGE


#--env \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0