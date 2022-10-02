
#### Arborescence:
````console
rm -r  /home/marc/Bureau/Asus
mkdir -p /home/marc/Bureau/Asus/CONTROL/
touch /home/marc/Bureau/Asus/CONTROL/changelog.txt
touch /home/marc/Bureau/Asus/CONTROL/config.json
echo "Plex TV" > /home/marc/Bureau/Asus/CONTROL/description.txt
echo "Drthrax" > /home/marc/Bureau/Asus/CONTROL/license.txt
touch /home/marc/Bureau/Asus/CONTROL/pre-install.sh
touch /home/marc/Bureau/Asus/CONTROL/pre-uninstall.sh
touch /home/marc/Bureau/Asus/CONTROL/post-install.sh
touch /home/marc/Bureau/Asus/CONTROL/post-uninstall.sh
touch /home/marc/Bureau/Asus/CONTROL/start-stop.sh
cp /home/marc/Bureau/icon.png /home/marc/Bureau/Asus/CONTROL/
````

#### Edition des scripts
````console
nano /home/marc/Bureau/Asus/CONTROL/config.json; nano /home/marc/Bureau/Asus/CONTROL/pre-install.sh; nano /home/marc/Bureau/Asus/CONTROL/post-install.sh; nano /home/marc/Bureau/Asus/CONTROL/start-stop.sh;
````


#### config.json
````json
{
 "general": {
   "package": "MonPackage",
   "name": "AppCentral",
   "version": "1.0",
   "depends": [ "docker-ce(>=20.10.2.r2)"],
   "developer": "Marc Jaffre",
   "maintainer": "Drthrax74",
   "email": "teste74@hotmail.fr",
   "website": "http://localhost",
   "architecture": "x86-64",
   "firmware": "4.1.0",
   "default-lang": "fr-FR",
   "memory-limit": "2048",
   "memory-advice": "2000",
   "privacy-statement": "http://localhost/privacy.html"},
   "adm-desktop":{ "app":{ "type":"custom", "protocol":"http", "port":"32400", "url": "/web"}},
   "privilege":{ "accessible": "users", "customizable": "true"},
   "register":{
   	"share-folder":[ {"name":"Docker", "description":"Data and files directory for Docker Apps"} ],
   	"boot-priority":{ "start-order":65, "stop-order":35},
	"port":[32400  ]
   }
}
````


----------------------------------------------------------------------------------------------------------------------------------------------------------
### pre-install.sh
````console
docker pull linuxserver/plex
````

----------------------------------------------------------------------------------------------------------------------------------------------------------
### post-install.sh
````console
##########################################################################################################################################################
docker pull linuxserver/plex
##########################################################################################################################################################
CONTAINER_TEST=$(docker container ls -a | grep Plex | awk '{print $1}')
if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi
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
docker create -i -t --name=Plex --net=host  -p 32400:32400  -e PUID=1000 -e PGID=100 -e VERSION=docker --restart unless-stopped linuxserver/plex
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
##########################################################################################################################################################
````

----------------------------------------------------------------------------------------------------------------------------------------------------------
#### Start-stop.sh
````console
#############################################################################################
CONTAINER_NAME=Plex
#############################################################################################
ADM_SSL_FILE=/usr/builtin/etc/certificate/ssl.pem
PORTAINER_SSL_FILE=/share/Docker/PortainerCE/data/certs/cert.pem
PORTAINER_KEY_FILE=/share/Docker/PortainerCE/data/certs/key.pem
CERT_DIFF=$(diff -bBq $ADM_SSL_FILE $PORTAINER_SSL_FILE | grep differ | awk '{print $5}')
#############################################################################################
case "$1" in
	start)
  	echo "Start $CONTAINER_NAME container..."
    docker start $CONTAINER_NAME
    sleep 3                  
    ;;
	stop)
		echo "Stop $CONTAINER_NAME container..."
		docker stop $CONTAINER_NAME
		if [ "$CERT_DIFF" == "differ" ]; then
			rm -f $PORTAINER_SSL_FILE
			rm -f $PORTAINER_KEY_FILE
		fi
		sleep 3
		;;
	reload)
  	echo "Reload $CONTAINER_NAME container..."		
		docker stop  $CONTAINER_NAME
			if [ "$CERT_DIFF" == "differ" ]; then
				rm -f $PORTAINER_SSL_FILE
				rm -f $PORTAINER_KEY_FILE
			fi
		sleep 3
    docker start $CONTAINER_NAME
    sleep 2
		;;
		
	*)
		echo "Usage: $0 {start|stop|reload}"
    exit 1
    ;;

esac
exit 0
#############################################################################################
````


----------------------------------------------------------------------------------------------------------------------------------------------------------
#### Création du Package
```
cd /home/marc/Bureau/Asus/;
apkg-tools_py2.py create . ;
chmod -R o+w  /home/marc/Bureau/Asus/;
mv /home/marc/Bureau/Asus/*.apk /media/sf_LAMP
```
