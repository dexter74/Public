######################################################
# Déclaration des variables #
#############################
CONTAINER_NAME=Emby

######################################################
case "$1" in
  start)
    docker start $CONTAINER_NAME
    sleep 3
    ;;
  stop)
    docker stop $CONTAINER_NAME
    sleep 3
    ;;
  reload)
    docker stop $CONTAINER_NAME
    sleep 3
    docker start $CONTAINER_NAME
    ;;
  *)
		echo "Usage: $0 {start|stop|reload}"
    exit 1
    ;;
esac
exit 0
######################################################
