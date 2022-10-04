#!/bin/sh

##########################################################################################################################################################
# Start-Stop #
##############
case "$1" in
  start)
    docker start Plex
    sleep 3
    ;;
  stop)
    docker stop Plex
    sleep 3
    ;;
  reload)
    docker stop Plex
    sleep 3
    docker start Plex
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
esac

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
