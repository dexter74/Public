##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Emby
IMAGE=linuxserver/emby
HTTP=8096:8096
HTTPS=8920:8920


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
--publish $HTTPS \
--device /dev/dri:/dev/dri \
--restart unless-stopped \
--label cacher="non" \
$IMAGE:latest

##########################################################################################################################################################
docker start $CONTAINER_NAME
