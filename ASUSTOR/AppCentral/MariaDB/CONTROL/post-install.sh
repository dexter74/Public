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
cp /volume1/.@plugins/AppCentral/MariaDB/CONTROL/requete.sql /volume1/Docker/$CONTENEUR
docker exec -it MariaDB sh -c 'mysql -h 127.0.0.1 -uroot -proot < /config/requete.sql'

docker exec -it MariaDB mysql -uroot -proot -e "CREATE USER 'bitwarden'@'%' IDENTIFIED BY 'bitwarden';"
docker exec -it MariaDB mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON `bitwarden`.* TO `bitwarden`@`%` WITH GRANT OPTION;"
docker exec -it MariaDB mysql -uroot -proot -e "CREATE DATABASE nextcloud'@;"
docker exec -it MariaDB mysql -uroot -proot -e "CREATE USER 'nextcloud'@'%' IDENTIFIED BY 'nextcloud';"
docker exec -it MariaDB mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`%` WITH GRANT OPTION;"
##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
