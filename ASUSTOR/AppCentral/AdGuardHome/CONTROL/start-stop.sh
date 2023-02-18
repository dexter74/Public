#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=AdGuardHome
PORT=3272

case "$1" in
    start)
        echo "Start $CONTAINER_NAME container..."
        sed -i -e "s/80/$PORT/g" /share/Docker/AdGuardHome/conf/AdGuardHome.yaml
        docker start $CONTAINER_NAME
        sleep 3 
                        
        ;;
    stop)
    	echo "Stop $CONTAINER_NAME container..."
    	docker stop $CONTAINER_NAME
    	sleep 3
        ;;
    reload)
    	echo "Reload $CONTAINER_NAME container..."
    	docker stop  $CONTAINER_NAME
    	sleep 3
    	docker start $CONTAINER_NAME
    	sleep 3
        ;;
    *)
        echo "Usage: $0 {start|stop|reload}"
        exit 1
        ;;
esac
exit 0

