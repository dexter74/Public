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
ADMIN_TOKEN=admin

##########################################################################################################################################################
# Read-Only Config #
####################
DATA_FOLDER=data

# Database URL
MYSQL_USER=bitwarden
MYSQL_PASS=bitwarden
MYSQL_HOST=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT=3306
MYSQL_DATABASE=bitwarden


##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
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
$IMAGE

# --env DATABASE_URL="data/db.sqlite3" \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
