#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
container=$(docker container ls -a | grep AdGuardHome | awk '{print $1}')
im=$(docker images | grep adguard/adguardhome | grep latest | awk '{print $3}')

##########################################################################################################################################################
# Message de Sortie #
#####################
echo "pre-uninstall"
echo $container
echo $im

##########################################################################################################################################################
# Suppression du conteneur #
############################
if [ ! -z $container ]; then
	docker rm -f $container
fi

if [ ! -z $im ]; then
	if [ "$APKG_PKG_STATUS" == "uninstall" ]; then
		docker rmi -f $im
	fi
fi
