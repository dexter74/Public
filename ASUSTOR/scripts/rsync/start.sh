clear;

# Chargement de la configuration
source ./settings.conf

# Protection
exit;

########################
# NAS Vers MyArchives1 #
########################
nohup rsync $OPTION "$DOCKER_SOURCE"     "$DOCKER_DESTINATION"     > docker.out     2> docker.err &
nohup rsync $OPTION "$DOWNLOAD_SOURCE"   "$DOWNLOAD_DESTINATION"   > download.out   2> download.err &
nohup rsync $OPTION "$HOME_SOURCE"       "$HOME_DESTINATION"       > home.out       2> home.err &
nohup rsync $OPTION "$MUSIC_SOURCE"      "$MUSIC_DESTINATION"      > music.out      2> music.err &
nohup rsync $OPTION "$SAUVEGARDE_SOURCE" "$SAUVEGARDE_DESTINATION" > sauvegarde.out 2> sauvegarde.err &
nohup rsync $OPTION "$WEB_SOURCE"        "$WEB_DESTINATION"        > web.out        2> web.err &
nohup rsync $OPTION "$WINDOWS_SOURCE"    "$WINDOWS_DESTINATION"    > windows.out    2> windows.err &

