#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Portainer
IMAGE=portainer/portainer-ce
HTTP=19900:9000
HTTPS=19943:9443
AUTRE=19800:8000

##########################################################################################################################################################
# Fermeture du Conteneur 
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Certficat SSL #
#################
ADM_SSL_FILE=/usr/builtin/etc/certificate/ssl.pem 
PORTAINER_SSL_FILE=/share/Docker/PortainerCE/data/certs/cert.pem
PORTAINER_KEY_FILE=/share/Docker/PortainerCE/data/certs/key.pem

##########################################################################################################################################################
# Mise à jour du Certificat #
#############################
# Code Source: ASUSTOR
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
docker create -i -t --name=$CONTENEUR \
	-p $HTTPS \
	-p $HTTP \
	-p $AUTRE \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /etc/localtime:/etc/localtime:ro \
	-v /usr/builtin/etc/certificate:/certs:ro \
	-v /share/Docker/PortainerCE/data:/data:rw \
	--restart always \
	--label cacher="oui" \
	portainer/portainer-ce:latest \
	--sslcert /certs/ssl.pem --sslkey /certs/ssl.pem \
	--hide-label cacher="oui";

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Patienter le démarrage du Conteneur #
#######################################
sleep 3

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
