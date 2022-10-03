##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Plex
IMAGE=linuxserver/plex
HTTP=32400:32400

##########################################################################################################################################################
# Fermeture du Conteneur 
docker container rm -f  $CONTAINER_NAME

##########################################################################################################################################################
# Lancement du Conteneur
docker run -d \
--name=$CONTAINER_NAME \
--volume /volume1/Docker/$CONTAINER_NAME:/config \
--volume /volume1/Video:/Video \
--net=host \
--publish $HTTP \
--device /dev/dri:/dev/dri \
--restart unless-stopped \
--label cacher="non" \
$IMAGE:latest

##########################################################################################################################################################
docker start $CONTAINER_NAME
