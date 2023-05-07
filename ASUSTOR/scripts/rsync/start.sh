######################################################################################################################
# NAS Vers MyArchives1 #
########################
clear;

######################################################################################################################
# Chargement de la configuration
source ./settings.conf

######################################################################################################################
# Sauvegarde Réelle #
#####################
#nohup rsync $OPTION "$DOCKER_SOURCE"     "$DOCKER_DESTINATION"     > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$DOWNLOAD_SOURCE"   "$DOWNLOAD_DESTINATION"   > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$HOME_SOURCE"       "$HOME_DESTINATION"       > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$MUSIC_SOURCE"      "$MUSIC_DESTINATION"      > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$SAUVEGARDE_SOURCE" "$SAUVEGARDE_DESTINATION" > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$WEB_SOURCE"        "$WEB_DESTINATION"        > rsync.out 2> rsync.err &
#nohup rsync $OPTION "$WINDOWS_SOURCE"    "$WINDOWS_DESTINATION"    > rsync.out 2> rsync.err &
######################################################################################################################
