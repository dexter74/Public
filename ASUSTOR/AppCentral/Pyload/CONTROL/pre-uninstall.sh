#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
IMAGE=writl/pyload
CONTENEUR=PyLoad

##########################################################################################################################################################
echo "pre-uninstall"
echo $CONTENEUR

##########################################################################################################################################################
if [ ! -z $CONTENEUR ]; then 
	docker kill $CONTENEUR
	sleep 2
	docker rm -f $CONTENEUR
fi

##########################################################################################################################################################
if [ ! -z $im ]; then 
	if [ "$APKG_PKG_STATUS" == "uninstall" ]; then
		docker rmi -f $IMAGE
	fi
fi

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
