#!/bin/sh

##########################################################################################################################################################
# Déclaration des variables #
#############################
CONTENEUR=wireguard

##########################################################################################################################################################
# Arrêt du conteneur #
######################
docker stop $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
