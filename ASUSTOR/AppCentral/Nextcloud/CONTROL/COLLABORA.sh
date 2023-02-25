#!/bin/sh

##########################################################################################################################################################
# Nettoyage de la console #
###########################
clear;

##########################################################################################################################################################
# Déclaration des variables #
#############################
CONTENEUR=Collabora
IMAGE=collabora/code
RESTART=unless-stopped
PORT=1121

##########################################################################################################################################################
# Configuration des accès Nextcloud #
#####################################
USERNAME=$(grep "1000" /etc/passwd | cut -d ":" -f 1)
IP_NAS=$(ip add  | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR 2>/dev/null;

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--net=bridge \
--hostname $CONTENEUR \
--restart $RESTART \
-- env TZ="EUROPE\PARIS" \
--volume \
--publish $PORT:80 \
$IMAGE:latest

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
