#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable #
##############################
CONTENEUR=NordVPN
RESTART="unless-stopped"
RESEAU="bridge"
PERMISSION_1="NET_ADMIN"
PERMISSION_2="NET_RAW"
UTILISATEUR=""
MOTDEPASSE=""
TECHNO="NordLynx"
PAYS="Switzerland"
RESEAU_AUTORISE="192.168.1.0/24"
IMAGE="bubuntux/nordvpn"
QBITORRENT="1007:1007"

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name="$CONTENEUR" \
--restart "$RESTART" \
--net="$RESEAU" \
--cap-add="$PERMISSION_1" \
--cap-add="$PERMISSION_2" \
--sysctl net.ipv6.conf.all.disable_ipv6="1" \
--env USER="$UTILISATEUR" \
--env PASS="$MOTDEPASSE" \
--env CONNECT="$PAYS" \
--env TECHNOLOGY="$TECHNO" \
--env NETWORK="$RESEAU_AUTORISE" \
--publish $QBITORRENT \
$IMAGE

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
