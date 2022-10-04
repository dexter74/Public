#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Portainer

case "$1" in
  start)
    docker start $CONTENEUR
    sleep 3
    ;;
  stop)
    docker stop $CONTENEUR
    sleep 3
    ;;
  reload)
    docker stop $CONTENEUR
    sleep 3
    docker start $CONTENEUR
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
   
esac
exit 0
##########################################################################################################################################################
