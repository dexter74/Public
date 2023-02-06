#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=NOIP
IMAGE=aanousakis/no-ip
RESTART=unless-stopped
RESEAU=bridge
IDENTIFIANT=email@wanadoo.fr
MOTDEPASSE=Passw0rd2023
MONDOMAIN=mondomain.ddn.net
INTERVAL_MAJ_IP=1440
##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart $RESTART \
--net=$RESEAU \
--hostname $CONTENEUR \
--env USERNAME="$IDENTIFIANT" \
--env PASSWORD="$MOTDEPASSE" \
--env DOMAINS="$MONDOMAIN" \
--env INTERVAL="$INTERVAL_MAJ_IP" \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
