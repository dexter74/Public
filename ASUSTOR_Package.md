
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
touch /home/marc/Bureau/Asus/CONTROL/pre-snapshot-restore.sh
touch /home/marc/Bureau/Asus/CONTROL/post-snapshot-restore.sh
touch /home/marc/Bureau/Asus/CONTROL/start-stop.sh
````

#### Edition des scripts
````console
nano /home/marc/Bureau/Asus/CONTROL/config.json; nano /home/marc/Bureau/Asus/CONTROL/pre-install.sh; nano /home/marc/Bureau/Asus/CONTROL/post-install.sh; nano /home/marc/Bureau/Asus/CONTROL/start-stop.sh;
````


#### config.json
````json
{
   "general":{
      "package":"MonPackage",
      "name":"Plex",
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
      "memory-limit":"4096",
      "memory-advice":"2000",
      "privacy-statement":"http://localhost/privacy.html"
   },
   "adm-desktop":{
      "app":{ "type":"custom", "protocol":"http", "port":"32400", "url":"/" },
      "privilege":{  "accessible":"users", "customizable": "true"},
      "register":{ "share-folder":[ { "name":"Docker", "description":"Dossier Docker"}]},
      "boot-priority":{ "start-order":65, "stop-order":35},
      "port":[19943]
   }

}
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
docker create -i -t --name=Plex --net=host  -p 32400:32400  -e PUID=1000 -e PGID=100 -e VERSION=docker --restart unless-stopped linuxserver/plex
docker start Plex;
exit 0
````



#### Start-stop.sh
````
TEST=$(docker ps | grep Plex | cut -c 181-185)
if [ $TEST = Plex ];then
	docker stop Plex;
fi
````





#### Création du Package
```
cd /home/marc/Bureau/Asus/
apkg-tools_py2.py create .
chmod -R o+w  /home/marc/Bureau/Asus/
```

#### Copie
```
mv /home/marc/Bureau/Asus/*.apk /mnt/sf_LAMP
```
