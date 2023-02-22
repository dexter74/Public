#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable #
##############################
IMAGE="qmcgaw/gluetun"
CONTENEUR="NordVPN"
RESTART="unless-stopped"

FOURNISSEUR="nordvpn"
PAYS="Switzerland"
UTILISATEUR="user@email.com"
MOTDEPASSE="password"
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
--cap-add="NET_ADMIN" \
--sysctl net.ipv6.conf.all.disable_ipv6="1" \
--env VPN_SERVICE_PROVIDER="$FOURNISSEUR" \
--env SERVER_REGIONS="$PAYS" \
--env OPENVPN_USER="$UTILISATEUR" \
--env OPENVPN_PASSWORD="$MOTDEPASSE" \
--publish "$QBITORRENT" \
$IMAGE

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
