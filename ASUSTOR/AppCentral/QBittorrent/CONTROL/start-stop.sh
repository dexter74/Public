#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=qBittorrent
##########################################################################################################################################################
# Message d'information #
#########################
echo "start-stop"

##########################################################################################################################################################
# Start-Stop #
##############
case "$1" in
    start)
        echo "Start $CONTENEUR container..."
        cat "/volume1/.@plugins/AppCentral/qBittorrent/CONTROL/qBittorrent.conf" > "/share/Docker/qBittorrent/qBittorrent.conf";
        docker start $CONTENEUR
        sleep 3
        ;;
    stop)
    	echo "Stop $CONTENEUR container..."
    	docker stop $CONTENEUR
        cat "/volume1/.@plugins/AppCentral/qBittorrent/CONTROL/qBittorrent.conf" > "/share/Docker/qBittorrent/qBittorrent.conf";
    	sleep 3
        ;;
    reload)
    	echo "Reload $CONTENEUR container..."
    	docker stop  $CONTENEUR
    	sleep 3
    	docker start $CONTENEUR
    	sleep 3
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
