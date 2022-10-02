##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Emby
PORTS=8096:8096
USER_ID=1000
GROUP_ID=999
GIDLIST=100

##########################################################################################################################################################
CONTAINER_TEST=$(docker container ls -a | grep $CONTAINER_NAME | awk '{print $1}')

##########################################################################################################################################################
# Mise à jour de l'image #
##########################
docker pull emby/embyserver

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

docker run -d --net=bridge \
  --name $CONTAINER_NAME \
  --restart unless-stopped \
  -v '/share/Docker/Emby:/config' \
  -v '/share/Video/:/Video' \
  --device=/dev/dri:/dev/dri \
  -p $PORTS \
  -e UID=$USER_ID \
  -e GID=$GROUP_ID \
  -e GIDLIST=$GIDLIST \
  --label cacher="oui" \
emby/embyserver


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
