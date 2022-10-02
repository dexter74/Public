##########################################################################################################################################################
# Mise à jour de l'image #
##########################
docker pull emby/embyserver

##########################################################################################################################################################
# Création du Conteneur #
#########################
docker container rm -f Emby 

docker run -d --net=bridge \
  --name Emby \
  --restart unless-stopped \
  -v '/share/Docker/Emby:/config' \
  -v '/share/Video/:/Video' \
  --device=/dev/dri:/dev/dri \
  -p 8096:8096 \
  -e UID=1000 \
  -e GID=999 \
  -e GIDLIST=100 \
  emby/embyserver

# --label cacher="oui" \




##########################################################################################################################################################
docker start Emby
##########################################################################################################################################################
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
