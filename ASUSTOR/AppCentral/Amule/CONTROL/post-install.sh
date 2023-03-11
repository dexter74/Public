#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Amule
IMAGE=ngosang/amule
HTTP=1200
RESTART=unless-stopped
IP_NAS=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
GUI_PASSWORD=admin
WEBUI_PWD=admin

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR;

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t \
--name=$CONTENEUR \
--restart $RESTART \
--net=bridge \
--hostname $CONTENEUR \
--env PUID=1000 \
--env GID=1000  \
--env TZ=Europe/Paris \
--env GUI_PWD=$GUI_PASSWORD \
--env WEBUI_PWD=$WEBUI_PWD \
--env MOD_AUTO_RESTART_ENABLED=true \
--env 'MOD_AUTO_RESTART_CRON=0 6 * * *' \
--env MOD_AUTO_SHARE_ENABLED=false \
--env MOD_AUTO_SHARE_DIRECTORIES='/incoming;/my_movies' \
--env MOD_FIX_KAD_GRAPH_ENABLED=true \
--publish $HTTP:4711 \
--volume /volume1/Docker/$CONTENEUR/config:/home/amule/.aMule \
--volume /volume1/Docker/$CONTENEUR/incoming:/incoming \
--volume /volume1/Docker/$CONTENEUR/temp:/temp \
$IMAGE:latest;

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
