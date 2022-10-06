````json
{
  "general":{ 
    "package":"Exemple", 
    "name":"Exemple", 
    "version":"1.0", 
    "depends": [ 
    "docker-ce(>=20.10.2.r2)"], 
    "conflicts":"", 
    "developer":"XXXXXXX", 
    "maintainer":"XXXXXXX", 
    "email":"XXXXXXX@XXXXXXX.xx", 
    "website":"https://XXXXXXX", 
    "architecture":"x86-64", 
    "firmware":"4.1.0", 
    "default-lang":"fr-FR",
    "memory-limit":"2048",
    "memory-advice":"2048",
    "privace-statement":"https://XXXXXXX" },

  "adm-desktop":{
    "app":{
      "type":"custom",
      "protocol":"http", 
      "port":"XXXXXXX", 
      "url":"/"},  
    "privilege":{
      "accessible":"administrators", 
      "customizable": "true" }
  },

  "register":{
    "symbolic-link":{},
      "share-folder":[
        { "name":"Docker", "description":"Dossier Docker Requis" },
	{ "name":"Download", "description":"Dossier Download Requis" },
	{ "name":"Video", "description":"Dossier Video Requis" } ],
	"port":[ "123456", "678910" ],
	"boot-priority":[{ "start-order":"55", "stop-order":"3" }],
	"prerequisites":{  "enable-service":[], "restart-service":[] }
	}
}
````


````bash
#!/bin/sh

##########################################################################################################################################################
# Déclaration de Variable #
###########################
CONTENEUR=

##########################################################################################################################################################
# Start-Stop #
##############
case "$1" in
  start)
    docker start $CONTENEUR
    sleep 3
    ;;
  stop)
    docker stop $CONTENEUR
    sleep 3
    ;;
  reload)
    docker stop $CONTENEUR
    sleep 3
    docker start $CONTENEUR
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
esac

##########################################################################################################################################################
# Code retour de Fermeture #
############################
exit 0
````
