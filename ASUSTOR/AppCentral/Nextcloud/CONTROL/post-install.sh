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
NEXTCLOUD_DOM="nextcloud.local nextcloud74.ddns.net"

##########################################################################################################################################################
# Configuration de la connexion à la BDD #
##########################################
SQL_PORT="3306"
SQL_DB="nextcloud"
SQL_USER="nextcloud"
SQL_PASS="nextcloud"

##########################################################################################################################################################
# Permissions #
###############
# chown 33:33 -R /volume1/Docker/${CONTENEUR}

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR   2>/dev/null;
rm -rf /volume1/Docker/${CONTENEUR} 2>/dev/null;

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t \
--name=$CONTENEUR \
--net=bridge \
--hostname $CONTENEUR \
--restart $RESTART \
--env NEXTCLOUD_TRUSTED_DOMAINS="$NEXTCLOUD_DOM $IP_NAS" \
--env MYSQL_HOST=${IP_NAS}:${SQL_PORT} \
--env MYSQL_DATABASE=$SQL_DB \
--env MYSQL_USER=$SQL_USER \
--env MYSQL_PASSWORD=$SQL_PASS \
--env NEXTCLOUD_ADMIN_USER=$NEXTCLOUD_USER \
--env NEXTCLOUD_ADMIN_PASSWORD=$NEXTCLOUD_PASS \
--volume /volume1/Docker/${CONTENEUR}/cfg:/var/www/html/config       \
--publish $PORT:80 \
$IMAGE:latest

# --volume /volume1/Docker/${CONTENEUR}/apps:/var/www/html/custom_apps \
#--volume /volume1/Docker/${CONTENEUR}/data:/var/www/html/data        \
#--volume /volume1/Docker/${CONTENEUR}/themes:/var/www/html/themes    \

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR;

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
