#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable #
##############################
IMAGE="qmcgaw/gluetun"
CONTENEUR="NordVPN"
RESTART="unless-stopped"

FOURNISSEUR="nordvpn"
PAYS="Switzerland"
UTILISATEUR="napoleon744@wanadoo.fr"
MOTDEPASSE="Azerty74240@"
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
--env TZ="EUROPE\PARIS" \
--publish "$QBITORRENT" \
--publish 9001:8000 \
--device "/dev/net/tun:/dev/net/tun" \
--volume /share/Docker/$CONTENEUR:/gluetun \
$IMAGE

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Vérification #
################
# docker exec -it $CONTENEUR sh

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
