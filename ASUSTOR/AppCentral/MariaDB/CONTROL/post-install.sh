#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=MariaDB
PORT=3306:3306
IMAGE=linuxserver/mariadb
RESTART=unless-stopped
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
--env MYSQL_ROOT_PASSWORD="root" \
--env MYSQL_DATABASE="database" \
--env MYSQL_USER="username" \
--env MYSQL_PASSWORD="password" \
--env REMOTE_SQL="https://raw.githubusercontent.com/dexter74/Public/main/ASUSTOR/AppCentral/MariaDB/CONTROL/requete.sql" \
--env TZ="Europe/Paris" \
--env PUID=1000 \
--env PGID=100 \
--volume /volume1/Docker/$CONTENEUR:/config \
--publish $PORT \
$IMAGE:latest

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Création des BDD #
####################
#docker stop $CONTENEUR;
#cp /volume1/.@plugins/AppCentral/MariaDB/CONTROL/requete.sql /volume1/Docker/$CONTENEUR;
#docker start $CONTENEUR;
#docker exec -it MariaDB mysql -u root -p /config/requete.sql;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
