#!/bin/sh

##########################################################################################################################################################
# Chargement des binaires disponibles #
#######################################
. /etc/script/lib/command.sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
APKG_PKG_DIR=/usr/local/AppCentral/AdGuardHome
CONTENEUR=AdGuardHome

case "$1" in
  start)
    docker start $CONTENEUR
    sleep 5
    ;;

  stop)
    docker stop $CONTENEUR
    sleep 5
    ;;

  reload)
    docker stop $CONTENEUR
    sleep 5
    docker start $CONTENEUR
    ;;

  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
   
esac

exit 0
##########################################################################################################################################################
