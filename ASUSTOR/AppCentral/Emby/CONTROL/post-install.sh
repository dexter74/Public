#!/bin/sh
##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Emby
PORTS=8096:8096
USER_ID=1000
GROUP_ID=999

##########################################################################################################################################################
CONTAINER_TEST=$(docker container ls -a | grep $CONTAINER_NAME | awk '{print $1}')

##########################################################################################################################################################
# Mise à jour de l'image #
##########################
docker container rm -f $CONTAINER_TEST

docker run -d \
  --name=$CONTAINER_NAME \
  --net=host \
  --restart unless-stopped \
  --env UID=1000 \
  --env GID=999 \
  --volume '/share/Docker/Emby:/config' \
  --volume '/share/Video:/Video' \
  --device /dev/dri:/dev/dri \
  --publish $PORTS \
  emby/embyserver
  
  
  
##########################################################################################################################################################
docker start $CONTAINER_NAME

case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		oldim=$(docker images | grep emby/embyserver | grep none | awk '{print $3}')
		echo $oldim
		if [ ! -z $oldim ]; then 
			docker rmi -f $oldim
		fi
		;;
	*)
		;;
esac
exit 0
