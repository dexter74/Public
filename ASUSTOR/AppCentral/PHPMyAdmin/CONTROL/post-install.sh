#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=PHPMyAdmin
IMAGE=phpmyadmin/phpmyadmin

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR
PORT0=80:80
PORT1=443:443
PORT2=81:81
##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name $CONTENEUR \
--restart unless-stopped \
--net=host \
--hostname $CONTENEUR \
--env TZ="Europe/Paris" \
--publish $PORT0 \

--label cacher="oui" \
$IMAGE







##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

