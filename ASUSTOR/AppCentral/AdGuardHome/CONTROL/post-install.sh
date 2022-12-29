#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=AdGuardHome
IMAGE=adguard/adguardhome
RESTART=unless-stopped
# WebUI=80

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker run -d \
--name=$CONTENEUR \
--hostname $CONTENEUR \
--net=host \
--restart $RESTART \
--env TZ="Europe/Paris" \
--volume /volume1/Docker/$CONTENEUR/conf:/opt/adguardhome/conf \
--volume /volume1/Docker/$CONTENEUR/work:/opt/adguardhome/work \
--volume /usr/builtin/etc/certificate:/sslcerts/:ro \
--cidfile="/usr/local/AppCentral/AdGuardHome/adguardhome.pid" \
--label cacher="oui" \
$IMAGE:latest

# --publish 3000:3000 \
# --publish 80:80 \
##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Changer le port WebUI #
#########################
# sed -i -e 's/80/$WebUI/g' /volume1/Docker/$CONTENEUR/conf/AdGuardHome.yaml


##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
