#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable #
##############################
IMAGE=vaultwarden/server
CONTENEUR=Bitwarden
PORT0=7777:80
PORT1=3012:3012
RESTART=unless-stopped

##########################################################################################################################################################
# General Settings #
####################
DATA_FOLDER=data
ADMIN_TOKEN=admin

##########################################################################################################################################################
# Read-Only Config #
####################
#MYSQL_HOST=$(ip add | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_HOST=$(ip add show eth0 | grep inet  | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_DATABASE=bitwarden
MYSQL_PORT=3306
MYSQL_USER=bitwarden
MYSQL_PASS=bitwarden


##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/data \
--env DOMAIN="https://${MYSQL_HOST}" \
--env DATA_FOLDER="$DATA_FOLDER" \
--env ADMIN_TOKEN="$ADMIN_TOKEN" \
--env DATABASE_URL="mysql://$MYSQL_USER:$MYSQL_PASS@$MYSQL_HOST:$MYSQL_PORT/$MYSQL_DATABASE" \
--publish $PORT0 \
--publish $PORT1 \
--label cacher="oui" \
$IMAGE:latest

# --env DATABASE_URL="data/db.sqlite3" \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
