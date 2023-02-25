#!/bin/sh

##########################################################################################################################################################
# Nettoyage de la console #
###########################
clear;

##########################################################################################################################################################
# Déclaration des variables #
#############################
CONTENEUR=Nextcloud
IMAGE=nextcloud
RESTART=unless-stopped
PORT=1120

##########################################################################################################################################################
# Configuration des accès Nextcloud #
#####################################
USERNAME=$(grep "1000" /etc/passwd | cut -d ":" -f 1)
IP_NAS=$(ip add  | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
NEXTCLOUD_USER="admin"
NEXTCLOUD_PASS="admin"
NEXTCLOUD_DOM="cloud74.ddns.net"

##########################################################################################################################################################
# Configuration de la connexion à la BDD #
##########################################
SQL_PORT="3306"
SQL_DB="nextcloud"
SQL_USER="nextcloud"
SQL_PASS="nextcloud"
PROTOCOL="HTTPS"

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR 2>/dev/null;

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--hostname $CONTENEUR \
--restart $RESTART \
--env NEXTCLOUD_TRUSTED_DOMAINS="$NEXTCLOUD_DOM $IP_NAS" \
--env MYSQL_HOST=${IP_NAS}:${SQL_PORT} \
--env MYSQL_DATABASE=$SQL_DB \
--env MYSQL_USER=$SQL_USER \
--env MYSQL_PASSWORD=$SQL_PASS \
--env NEXTCLOUD_ADMIN_USER=$NEXTCLOUD_USER \
--env NEXTCLOUD_ADMIN_PASSWORD=$NEXTCLOUD_PASS \
--env NEXTCLOUD_DATA_DIR=/var/www/html/data \
--volume /volume1/Docker/${CONTENEUR}_cfg:/var/www/html/config \
--volume /volume1/Docker/${CONTENEUR}_data:/var/www/html/data \
--publish $PORT:80 \
$IMAGE:latest

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
