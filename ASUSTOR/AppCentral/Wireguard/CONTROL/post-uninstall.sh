#!/bin/sh

##########################################################################################################################################################
# Suppression de l'image Docker #
#################################
docker container rm -f $CONTENEUR;
docker image rm -f $IMAGE;

##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0
