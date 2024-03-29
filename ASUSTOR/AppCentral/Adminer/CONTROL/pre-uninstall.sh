#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=Adminer
container=$(docker container ls -a | grep $CONTENEUR |awk '{print $1}')
im=$(docker images | grep $container | grep latest | awk '{print $3}')

##########################################################################################################################################################
echo "pre-uninstall"
echo $container
echo $im

##########################################################################################################################################################
if [ ! -z $container ]; then 
	docker kill $container
	sleep 2
	docker rm -f $container
fi

##########################################################################################################################################################
if [ ! -z $im ]; then 
	if [ "$APKG_PKG_STATUS" == "uninstall" ]; then
		docker rmi -f $im
	fi
fi


##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
