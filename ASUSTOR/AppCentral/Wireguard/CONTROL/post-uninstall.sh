#!/bin/sh

##########################################################################################################################################################
# Chargement de la configuration #
##################################
source ./settings.conf

##########################################################################################################################################################
# Suppression de l'image Docker #
#################################
docker container rm -f $CONTENEUR;
docker image rm -f $IMAGE;

##########################################################################################################################################################
# Suppression de la configuration #
###################################
#rm -rf /etc/wireguard;

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
