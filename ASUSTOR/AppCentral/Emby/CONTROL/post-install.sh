##########################################################################################################################################################
# Déclaration de la variable de test #
######################################

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f Emby

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=Emby \
--volume /volume1/Docker/Emby:/config \
--volume /volume1/Video:/Video \
--net=host \
--publish 8086:8086 \
--publish 8920:8920 \
--device /dev/dri:/dev/dri \
--restart unless-stopped \
linuxserver/emby:latest
