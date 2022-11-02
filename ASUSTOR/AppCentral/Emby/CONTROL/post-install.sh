#!/bin/sh
##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Emby
IMAGE=emby/embyserver
HTTP=8096:8096
HTTPS=8920:8920

##########################################################################################################################################################
# Arrêt du Conteneur #
######################
docker stop $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d --name $CONTENEUR \
--volume /share/Docker/Emby:/config \
--volume /share/Download:/Download \
--volume /share/Video:/Video \
--volume /share/MyArchive1:/MyArchive1 \
--volume /share/MyArchive2:/MyArchive2 \
--volume /share/MyArchive3:/MyArchive3 \
--volume /share/Music:/Music \
--net=bridge \
--publish $HTTP \
--publish $HTTPS \
--label cacher="oui" \
$IMAGE

# --env UID=1000 \ # The UID to run emby as (default: 2)
# --env GID=100 \ # The GID to run emby as (default 2)
# --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
 
##########################################################################################################################################################
# Code retour de fermeture #
############################
exit 0

