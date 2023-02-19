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
        mv "/volume1/.@plugins/AppCentral/qBittorrent/CONTROL/qBittorrent.conf" "/share/Docker/Qbitorrent/qBittorrent/qBittorrent.conf" 2>/dev/null
        docker start $CONTENEUR
        sleep 3
        ;;
    stop)
    	echo "Stop $CONTENEUR container..."
    	docker stop $CONTENEUR
        mv "/volume1/.@plugins/AppCentral/qBittorrent/CONTROL/qBittorrent.conf" "/share/Docker/Qbitorrent/qBittorrent/qBittorrent.conf" 2>/dev/null
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
