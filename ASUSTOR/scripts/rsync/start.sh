######################################################################################################################
# NAS Vers MyArchives1 #
########################
clear;

######################################################################################################################
# Chargement de la configuration
source ./settings.conf

######################################################################################################################
# Sécurité #
############
exit;

######################################################################################################################
# Création du dossier des rapports #
####################################
mkdir rapport;

######################################################################################################################
# Sauvegarde Réelle #
#####################
nohup rsync $OPTION "$DOCKER_SOURCE"     "$DOCKER_DESTINATION"     > docker.out     2> docker.err &
mv docker.* rapport/;

nohup rsync $OPTION "$DOWNLOAD_SOURCE"   "$DOWNLOAD_DESTINATION"   > download.out   2> download.err &
mv download.* rapport/;

nohup rsync $OPTION "$HOME_SOURCE"       "$HOME_DESTINATION"       > home.out       2> home.err &
mv home.* rapport/;

nohup rsync $OPTION "$MUSIC_SOURCE"      "$MUSIC_DESTINATION"      > music.out      2> music.err &
mv music.* rapport/;

nohup rsync $OPTION "$SAUVEGARDE_SOURCE" "$SAUVEGARDE_DESTINATION" > sauvegarde.out 2> sauvegarde.err &
mv sauvegarde.* rapport/;

nohup rsync $OPTION "$WEB_SOURCE"        "$WEB_DESTINATION"        > web.out        2> web.err &
mv web.* rapport/;

nohup rsync $OPTION "$WINDOWS_SOURCE"    "$WINDOWS_DESTINATION"    > windows.out    2> windows.err &
mv windows.* rapport/;
######################################################################################################################
