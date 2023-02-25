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
mv /volume1/.@plugins/AppCentral/MariaDB/CONTROL/requete.sql /volume1/Docker/$CONTENEUR;
sleep 70;
docker exec -it MariaDB sh -c 'mysql -h 127.0.0.1 -uroot -proot < /config/requete.sql'
mysql -h 127.0.0.1 -uroot -proot < /config/requete.sql

# mkdir MONDOSSIER donne : /volume0/usr/builtin/webman/portal/apis/appCentral/, bizarre ?

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
