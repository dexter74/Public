#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
IMAGE=linuxserver/cloud9

##########################################################################################################################################################
# Téléchargement de l'image #
#############################
docker pull $IMAGE

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0