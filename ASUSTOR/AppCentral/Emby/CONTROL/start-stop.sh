#############################################################################################
CONTAINER_NAME=Emby
#############################################################################################
case "$1" in
	start)
  	echo "Start $CONTAINER_NAME container..."
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
    sleep 2
		;;
		
	*)
		echo "Usage: $0 {start|stop|reload}"
    exit 1
    ;;

esac
exit 0
#############################################################################################
