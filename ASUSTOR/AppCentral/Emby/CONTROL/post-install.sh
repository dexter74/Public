#!/bin/sh

APP_DIR=/usr/local/AppCentral/emby-server

case "$APKG_PKG_STATUS" in

  install)
    getent passwd emby | grep data > /dev/null 2>&1 && userdel emby
    getent group emby > /dev/null 2>&1 || groupadd -r emby
    getent passwd emby > /dev/null 2>&1 || useradd -r -c 'Emby Server' -g emby -d /home/emby -m -s /bin/false emby && passwd -l emby > /dev/null
    ;;
  upgrade)
    getent passwd emby | grep data > /dev/null 2>&1 && userdel emby
    getent passwd emby > /dev/null 2>&1 || useradd -r -c 'Emby Server' -g emby -d /home/emby -m -s /bin/false emby && passwd -l emby > /dev/null
    ;;
  *)
    ;;

esac

exit 0
