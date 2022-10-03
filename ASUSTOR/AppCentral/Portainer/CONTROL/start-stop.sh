######################################################
case "$1" in
  start)
    docker start Portainer
    sleep 3
    ;;
  stop)
    docker stop Portainer
    sleep 3
    ;;
  reload)
    docker stop Portainer
    sleep 3
    docker start Portainer
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
   
esac
exit 0
######################################################
