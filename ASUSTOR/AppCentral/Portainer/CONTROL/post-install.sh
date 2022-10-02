
#!/bin/sh
#######################################################################################################################################################
# Récupération de l'image de Portainer #
########################################
docker pull portainer/portainer-ce:latest

#######################################################################################################################################################
# Variable Portainer #
######################
CONTAINER_TEST=$(docker container ls -a | grep PortainerCE | awk '{print $1}')

#######################################################################################################################################################
# Check contenu de la variable #
################################
if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi

#######################################################################################################################################################
# Certficat SSL #
#################
ADM_SSL_FILE=/usr/builtin/etc/certificate/ssl.pem 
PORTAINER_SSL_FILE=/share/Docker/PortainerCE/data/certs/cert.pem
PORTAINER_KEY_FILE=/share/Docker/PortainerCE/data/certs/key.pem

#######################################################################################################################################################
# Mise à jour du Certificat #
#############################
if [ -e $PORTAINER_SSL_FILE ]; then
	# Compare the ADM certificate and the Portainer copied one
	CERT_DIFF=$(diff -bBq $ADM_SSL_FILE $PORTAINER_SSL_FILE | grep differ | awk '{print $5}')
	
	# Before create and start Portainer Container, remove the old certificate if it's existed and different with ADM certificate.
	
	if [ "$CERT_DIFF" == "differ" ]; then
		rm -f $PORTAINER_SSL_FILE
		rm -f $PORTAINER_KEY_FILE
	fi
fi

#######################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t --name=PortainerCE \
	-p 19943:9443 \
	-p 19900:9000 \
	-p 19800:8000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /etc/localtime:/etc/localtime:ro \
	-v /usr/builtin/etc/certificate:/certs:ro \
	-v /share/Docker/PortainerCE/data:/data:rw \
	--restart unless-stopped \
	--label cacher="oui" \
	portainer/portainer-ce:latest \
	--sslcert /certs/ssl.pem --sslkey /certs/ssl.pem \
	 --hide-label cacher="oui";

#######################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start PortainerCE

#######################################################################################################################################################
# Inconnu #
###########
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
#######################################################################################################################################################
