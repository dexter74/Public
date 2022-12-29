#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=AdGuardHome
container_id=$()
docker container ls -a | grep $CONTENEUR |awk '{print $1}'
im=$(docker images | grep $container | grep latest | awk '{print $3}')

##########################################################################################################################################################
# Phrase de désinstallation #
#############################
echo "pre-uninstall"
