##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Plex
PORTS=32400:32400
USER_ID=1000
GROUP_ID=999

##########################################################################################################################################################
CONTAINER_TEST=$(docker container ls -a | grep $CONTAINER_NAME | awk '{print $1}'

##########################################################################################################################################################
# Mise à jour de l'image #
##########################
docker pull linuxserver/plex

##########################################################################################################################################################
# Vérification #
################
if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi


##########################################################################################################################################################
# Création du Conteneur #
#########################
docker container rm -f $CONTAINER_NAME 

# Bug : Host + -p $PORTS \
docker run -d \
	--name=$CONTAINER_NAME \
	--net=host \
	-e PUID=$USER_ID \
	-e PGID=$GROUP_ID \
	-e TZ=Europe/Paris \
	-v '/share/Video/:/Video' \
	-v '/share/Docker/Plex:/config' \
	--device=/dev/dri:/dev/dri \
	--restart unless-stopped \
	--label cacher="oui" \
	linuxserver/plex

##########################################################################################################################################################
docker start $CONTAINER_NAME
##########################################################################################################################################################
case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		oldim=$(docker images | grep $CONTAINER_NAME | grep none | awk '{print $3}')
		echo $oldim
		
		if [ ! -z $oldim ]; then 
			docker rmi -f $oldim
		fi
		;;
	*)
		;;
esac
exit 0
