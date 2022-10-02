
#### Arborescence:
````console
rm -r  /home/marc/Bureau/Asus
mkdir -p /home/marc/Bureau/Asus/CONTROL/
touch /home/marc/Bureau/Asus/CONTROL/changelog.txt
touch /home/marc/Bureau/Asus/CONTROL/config.json
touch /home/marc/Bureau/Asus/CONTROL/description.txt
touch /home/marc/Bureau/Asus/CONTROL/license.txt
touch /home/marc/Bureau/Asus/CONTROL/pre-install.sh
touch /home/marc/Bureau/Asus/CONTROL/pre-uninstall.sh
touch /home/marc/Bureau/Asus/CONTROL/post-install.sh
touch /home/marc/Bureau/Asus/CONTROL/post-uninstall.sh
touch /home/marc/Bureau/Asus/CONTROL/pre-snapshot-restore.sh
touch /home/marc/Bureau/Asus/CONTROL/post-snapshot-restore.sh

````

#### config.json
````json
echo '
{
   "general":{
      "package":"MonPackage",
      "name":"AppCentral",
      "version":"1.0",
      "depends":[
         "docker-ce(>=20.10.2.r2)"
      ],
      "developper":"Marc Jaffré",
      "maintainer":"Drthrax74",
      "email":"teste74@hotmail.fr",
      "website":"http://localhost",
      "architecture":"x86_64",
      "firmware":"4.1.0",
      "model":"53xx",
      "default-lang":"fr-FR",
      "memory-limit":"2048",
      "memory-advice":"2000",
      "privacy-statement":"http://localhost/privacy.html"
   },
   "adm-desktop":{
      "app":{
         "type":"custom",
         "session-id":"false",
         "protocol":"http",
         "port":"8080",
         "url":"/"
      },
      "privilege":{
         "accessible":"users",
         "customizable":"true"
      }
   },
   "register":{
      "port":[
         "9000, 5000"
      ],
      "share-folder":[
         {
            "name:":"Video",
            "description":"Partage Video"
         }
      ]
   },
   "prerequisites":{
      "enable-service":[
         "httpd"
      ],
      "restart-service":[
         ""
      ]
   },
   "boot-priority":{
      "start-order":95,
      "stop-order":5
   }
}' > /home/marc/Bureau/Asus/CONTROL/config.json
````

#### Edition des scripts
````console
nano /home/marc/Bureau/Asus/CONTROL/pre-install.sh
nano #### /home/marc/Bureau/Asus/CONTROL/post-install.sh
````

### pre-install.sh
````console
docker pull linuxserver/plex
````
### post-install.sh
````console
docker pull linuxserver/plex
CONTAINER_TEST=$(docker container ls -a | grep Plex | awk '{print $1}')

if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi


#######################################################################################################################################################
# Création du Conteneur #
#########################
docker create -i -t --name=Plex --net=host -e PUID=1000 -e PGID=100 -e VERSION=docker --restart unless-stopped linuxserver/plex
docker start Plex;
exit 0
````





#### Création du Package
```
chmod -R o+w  /home/marc/Bureau/Asus/
apkg-tools.py create /home/marc/Bureau/Asus/
```

