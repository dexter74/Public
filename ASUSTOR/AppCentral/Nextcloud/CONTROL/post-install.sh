#!/bin/sh

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
NEXTCLOUD_USER="admin"
NEXTCLOUD_PASS="admin"

##########################################################################################################################################################
# Configuration de la connexion à la BDD #
##########################################
SQL_HOST=$(ip add  | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
SQL_PORT="3306"
SQL_DB="nextcloud"
SQL_USER="nextcloud"
SQL_PASS="nextcloud"
SQL_DOM="cloud9.ddns.net"
PROTOCOL="HTTPS"

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--hostname $CONTENEUR \
--restart $RESTART \
--publish $PORT:80  \
$IMAGE:latest

# --env NEXTCLOUD_ADMIN_USER="$NEXTCLOUD_USER" \
# --env NEXTCLOUD_ADMIN_PASSWORD ="$NEXTCLOUD_PASS" \
# --env MYSQL_HOST="$SQL_HOST" \
# --env MYSQL_DATABASE="$SQL_PORT" \
# --env MYSQL_USER="$SQL_USER" \
# --env MYSQL_PASSWORD="$SQL_PASS" \
# --env NEXTCLOUD_TRUSTED_DOMAINS="$SQL_DOM" \
# --env OVERWRITEPROTOCOL="$PROTOCOL"
# --volume /volume1/Docker/$CONTENEUR/www:/var/www/html \
# --volume /volume1/Docker/$CONTENEUR/data:/var/www/html/data \
# --volume /volume1/Docker/$CONTENEUR/apache2:/etc/apache2 \


##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
