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
--env PUID=0 \
--env PGID=0 \
--env REMOTE_SQL="/volume1/.@plugins/AppCentral/MariaDB/CONTROL/requete.sql,https://raw.githubusercontent.com/dexter74/Public/main/ASUSTOR/AppCentral/MariaDB/CONTROL/requete.sql" \
--volume /volume1/Docker/$CONTENEUR:/config \
--publish $PORT \
$IMAGE:latest

# mkdir MONDOSSIER donne : /volume0/usr/builtin/webman/portal/apis/appCentral/, bizarre ?

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Fichier SQL dans le conteneur #
#################################
mv /volume1/.@plugins/AppCentral/MariaDB/CONTROL/requete.sql /volume1/Docker/$CONTENEUR;

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
