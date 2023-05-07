clear;

# Chargement de la configuration
source ./settings.conf

# Protection
exit;

########################
# NAS Vers MyArchives1 #
########################

#nohup rsync $OPTION "$DOCKER_SOURCE"     "$DOCKER_DESTINATION"     > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$DOWNLOAD_SOURCE"   "$DOWNLOAD_DESTINATION"   > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$HOME_SOURCE"       "$HOME_DESTINATION"       > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$MUSIC_SOURCE"      "$MUSIC_DESTINATION"      > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$SAUVEGARDE_SOURCE" "$SAUVEGARDE_DESTINATION" > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$WEB_SOURCE"        "$WEB_DESTINATION"        > myprogram.out 2> myprogram.err &
#nohup rsync $OPTION "$WINDOWS_SOURCE"    "$WINDOWS_DESTINATION"    > myprogram.out 2> myprogram.err &

rsync -avu --progress --delete $SOURCE $DESTINATION 
