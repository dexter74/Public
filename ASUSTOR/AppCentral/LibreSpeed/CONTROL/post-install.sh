#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=LibreSpeed
IMAGE=linuxserver/librespeed
HTTP=27016:80
IP_NAS=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d --name=$CONTENEUR \
--hostname $CONTENEUR \
--restart none \
--net=bridge \
--volume /volume1/Docker/$CONTENEUR:/config \
--env TZ="Europe/Paris" \
--env PASSWORD="password" \
--publish $HTTP \
$IMAGE

# https://hub.docker.com/r/linuxserver/librespeed
#--env DB_TYPE="sqlite,mysql,postgresql" \
#--env CUSTOM_RESULTS="false" \
#--env DB_HOSTNAME="" \
#--env DB_PORT="" \
#--env DB_NAME="" \
#--env DB_USERNAME="" \
#--env DB_PASSWORD="" \
##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
