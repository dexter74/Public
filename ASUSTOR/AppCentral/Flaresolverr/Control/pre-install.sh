#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
IMAGE=ghcr.io/flaresolverr/flaresolverr

##########################################################################################################################################################
# Téléchargement de l'image #
#############################
docker pull $IMAGE

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
