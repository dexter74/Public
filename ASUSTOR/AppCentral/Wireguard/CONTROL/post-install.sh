#!/bin/sh

##########################################################################################################################################################
# Déclaration de variable #
###########################
IMAGE=linuxserver/wireguard
CONTENEUR=wireguard
PORT=51820

##############################################################################################################################
# Wireguard sous Docker #
#########################
CONTENEUR=wireguard
IMAGE=linuxserver/wireguard
RESTART=unless-stopped
PORT=51820
#
##############################################################################################################################
# Récupération des informations #
#################################
# Récupération du nom de l'interface active
WIREGUARD_NET=$(ip add | grep -A2 -v "ff:ff\|DOWN\|valid\|lo\|dock" | grep "global" | cut -d "l" -f 3 | cut -c 2-50)
#
# Récupération de l'adresse IPV4
WIREGUARD_HOST=$(ip add show $IF_PHYSIC | grep inet | cut -d "/" -f 1 | cut -d "t" -f 2 | cut -c 2-50)
#
##############################################################################################################################
# Configuration Wireguard - Serveur #
#####################################
WIREGUARD_ADDR=10.0.0.1/24
WIREGUARD_PORT=$PORT
WIREGUARD_PRIVATE=AA5zhrdTCOb7ISqUZF3eTwwyCfEqRC935lOn4HsR20Y=
WIREGUARD_PUBLIC=AExeAE6MgH0ofW4WxSDLXoIuvoGyW6UPjWCUfya+Dno=
#
# Client 1:
CLIENT1_PUBLIC=JXtUuxYYQE1YBJsxiAiG2EdAJs/5cXdLKcX/J/3T/Vk=
CLIENT1_ALLOWIP=10.0.0.2/32
#
# Client 2:
CLIENT2_PUBLIC=9PM8zGiDKWwjZgxQC3yygFPer9aO58DtQCeM3HfyHTY=
CLIENT2_ALLOWIP=10.0.0.3/32
#
# Client 3:
CLIENT3_PUBLIC=O18/9fKBQoNLvRlw9C9iZU9gHeR67++8/NNaC7nfT00=
CLIENT3_ALLOWIP=10.0.0.4/32
#
##############################################################################################################################





##############################################################################################################################
# Génération de la configuration de Wireguard #
###############################################
# Création du Dossier
rm -r /etc/wireguard 2>/dev/null;
mkdir /etc/wireguard 2>/dev/null;

# Clés Public et Privée
echo "$WIREGUARD_PUBLIC" > /etc/wireguard/publickey
echo "$WIREGUARD_PRIVATE" > /etc/wireguard/privatekey

echo "################################################################################################################
# Configuration Serveur #
#########################
[Interface]
Address = $WIREGUARD_ADDR
ListenPort = $WIREGUARD_PORT
PrivateKey = $WIREGUARD_PRIVATE
################################################################################################################
# Pare-Feu #
############
PostUp     = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o $WIREGUARD_NET -j MASQUERADE
PostDown   = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o $WIREGUARD_NET -j MASQUERADE
################################################################################################################
# Clients #
###########
[Peer]
PublicKey  = $CLIENT1_PUBLIC
AllowedIPs = $CLIENT1_ALLOWIP
[Peer]
PublicKey  = $CLIENT2_PUBLIC
AllowedIPs = $CLIENT2_ALLOWIP
[Peer]
PublicKey  = $CLIENT3_PUBLIC
AllowedIPs = $CLIENT3_ALLOWIP
#############################################################################################################" > /etc/wireguard/wg0.conf




##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR;

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--cap-add=NET_ADMIN \
--cap-add=SYS_MODULE \
--env PUID=1000 \
--env PGID=100 \
--env TZ=Etc/PARIS \
--publish $PORT \
--volume /etc/wireguard:/config \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
