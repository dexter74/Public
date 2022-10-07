#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=PHPMyAdmin

##########################################################################################################################################################
# Arrêt du conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Suppression du conteneur #
############################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
