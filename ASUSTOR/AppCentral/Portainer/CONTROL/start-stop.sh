#!/bin/sh

echo "start-stop"

CONTAINER_NAME=PortainerCE

# Portainer will keep the certificate on data folder, need to check if the certificate is updated or not. If yes, need to remove old one,
# and Portainer will copy new one to the folder again while start the Container.

ADM_SSL_FILE=/usr/builtin/etc/certificate/ssl.pem

PORTAINER_SSL_FILE=/share/Docker/PortainerCE/data/certs/cert.pem
PORTAINER_KEY_FILE=/share/Docker/PortainerCE/data/certs/key.pem

# Compare the ADM certificate and the Portainer copied one

CERT_DIFF=$(diff -bBq $ADM_SSL_FILE $PORTAINER_SSL_FILE | grep differ | awk '{print $5}')
 

case "$1" in
    start)
        echo "Start $CONTAINER_NAME container..."
        docker start $CONTAINER_NAME
        sleep 3 
                        
        ;;
    stop)
    	echo "Stop $CONTAINER_NAME container..."
    	docker stop $CONTAINER_NAME
		
		# If the certificate is different, remove the old one after container stopped, Portainer will copy new one while start container.
		if [ "$CERT_DIFF" == "differ" ]; then
			rm -f $PORTAINER_SSL_FILE
			rm -f $PORTAINER_KEY_FILE
		fi
		
    	sleep 3
        ;;
    reload)
    	echo "Reload $CONTAINER_NAME container..."		
    	docker stop  $CONTAINER_NAME
		
		# If the certificate is different, remove the old one after container stopped, Portainer will copy new one while start container.
		if [ "$CERT_DIFF" == "differ" ]; then
			rm -f $PORTAINER_SSL_FILE
			rm -f $PORTAINER_KEY_FILE
		fi
		
    	sleep 3
		
    	docker start $CONTAINER_NAME
    	sleep 2
        ;;
    *)
        echo "Usage: $0 {start|stop|reload}"
        exit 1
        ;;
esac
exit 0
