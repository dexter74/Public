#!/bin/sh

echo "start-stop"

CONTENEUR=AdGuardHome
 
case "$1" in
    start)
        echo "Start $CONTENEUR container..."
        docker start $CONTENEUR
        sleep 3 
                        
        ;;
    stop)
    	echo "Stop $CONTENEUR container..."
    	docker stop $CONTENEUR
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
exit 0
