#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
IMAGE=ntop/ntopng

##########################################################################################################################################################
# Téléchargement de l'image #
#############################
docker pull $IMAGE

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0