#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=AdGuardHome
case "$1" in
  start)
    sleep 3
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
