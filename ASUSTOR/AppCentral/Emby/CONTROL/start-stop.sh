#!/bin/sh

######################################################
case "$1" in
  start)
    docker start Emby
    sleep 3
    ;;
  stop)
    docker stop Emby
    sleep 3
    ;;
  reload)
    docker stop Emby
    sleep 3
    docker start Emby
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
   
esac
exit 0
######################################################
