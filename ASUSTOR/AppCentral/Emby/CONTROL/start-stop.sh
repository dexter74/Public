#!/bin/sh

APP_DIR=/usr/local/AppCentral/emby-server
PID_FILE=/var/run/emby-server.pid

case $1 in

  start)
    start-stop-daemon -S -q -b -c emby:emby -x $APP_DIR/bin/emby-server -p $PID_FILE -m
    ;;

  stop)
    start-stop-daemon -K -q -p $PID_FILE
    ;;

  *)
    echo "usage: $0 {start|stop}"
    exit 1
    ;;

esac

exit 0
