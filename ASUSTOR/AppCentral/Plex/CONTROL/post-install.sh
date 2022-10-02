##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_TEST=$(docker container ls -a | grep Plex | awk '{print $1}')
CONTAINER_NAME=Plex
PORTS=32400:32400
USER_ID=1000
GROUP_ID=100
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
# Mise à jour Certificat SSL #
##############################
ADM_SSL_FILE=/usr/builtin/etc/certificate/ssl.pem 
PORTAINER_SSL_FILE=/share/Docker/PortainerCE/data/certs/cert.pem
PORTAINER_KEY_FILE=/share/Docker/PortainerCE/data/certs/key.pem
if [ -e $PORTAINER_SSL_FILE ]; then
	# Compare the ADM certificate and the Portainer copied one
	CERT_DIFF=$(diff -bBq $ADM_SSL_FILE $PORTAINER_SSL_FILE | grep differ | awk '{print $5}')
	# Before create and start Portainer Container, remove the old certificate if it's existed and different with ADM certificate.
	if [ "$CERT_DIFF" == "differ" ]; then
		rm -f $PORTAINER_SSL_FILE
		rm -f $PORTAINER_KEY_FILE
	fi
fi
##########################################################################################################################################################
# Création du Conteneur #
#########################
docker container rm Plex 

# Bug : Host + -p $PORTS \
docker run -d \
	--name=$CONTAINER_NAME \
	--net=host \
	-e PUID=$USER_ID \
	-e PGID=$GROUP_ID \
	-v '/share/Video/:/Video' \
	-v '/share/Docker/Plex:/config' \
	--device=/dev/dri:/dev/dri \
	linuxserver/plex



##########################################################################################################################################################
docker start Plex
##########################################################################################################################################################
case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		oldim=$(docker images | grep portainer/portainer-ce | grep none | awk '{print $3}')
		echo $oldim
		
		if [ ! -z $oldim ]; then 
			docker rmi -f $oldim
		fi
		;;
	*)
		;;
esac
exit 0
