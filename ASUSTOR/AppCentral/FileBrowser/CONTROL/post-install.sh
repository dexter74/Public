#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=FileBrowser
IMAGE=filebrowser/filebrowser
HTTP=1010:80

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
--volume /volume1/Docker/$CONTENEUR:/srv \
--volume /volume1/Docker/$CONTENEUR/database:/database \
--volume /volume1/Docker/$CONTENEUR/config:/config \
--volume /share/Download:/srv/Download \
--volume /share/Music:/srv/Music \
--volume /share/Video:/srv/Video \
--publish $HTTP \
--label cacher="oui" \
$IMAGE

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0