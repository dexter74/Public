#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable #
##############################
IMAGE="qmcgaw/gluetun"
CONTENEUR="NordVPN"
RESTART="unless-stopped"

FOURNISSEUR="nordvpn"
PAYS="Switzerland"
UTILISATEUR="@wanadoo.fr"
MOTDEPASSE=""
QBITORRENT="1110:1110"
JACKETT="1111:9117"
RADARR="1112:7878"
SONARR="1113:8989"
FLARESOLVERR="1115:8191"

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
--publish 9001:8000 \
--publish "$QBITORRENT" \
--publish "$JACKETT" \
--publish "$RADARR" \
--publish "$SONARR" \
--publish "$FLARESOLVERR" \
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
