#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=wireguard
IMAGE=linuxserver/wireguard
RESTART=unless-stopped
PORT=51820:51820/UDP

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t                                                    \
--name=$CONTENEUR                                                      \
--hostname $CONTENEUR                                                  \
--net=bridge                                                           \
--dns 192.168.1.1                                                      \
--restart $RESTART                                                     \
--env PUID="1000"                                                      \
--env PGID="100"                                                       \
--env TZ="EUROPE\PAris"                                                \
--cap-add="NET_ADMIN"                                                  \
--sysctl net.ipv4.ip_forward=1                                         \
--sysctl net.ipv4.conf.all.src_valid_mark=1                            \
--volume /volume1/Docker/$CONTENEUR:/config                            \
--volume /usr/local/AppCentral/adm-kernel-extensions/lib/:/lib/modules \
--publish $PORT                                                        \
--label cacher="oui"                                                   \
$IMAGE:latest

# --cap-add="SYS_MODULE" \

##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
