````json
{
"general":{ 
  "package":"XXXXXXX", 
  "name":"XXXXXXX", 
  "version":"1.0", 
  "depends": [ 
    "docker-ce(>=20.10.2.r2)"], 
    "conflicts":"", 
    "developer":"XXXXXXX", 
    "maintainer":"XXXXXXX.", 
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
	"share-folder":[{ "name":"Docker","description":"Ma super Description"}],
	"port":[ "123456", "678910" ],
	"boot-priority":[{ "start-order":"55", "stop-order":"3" }],
	"prerequisites":{  "enable-service":[], "restart-service":[] }
	}
}
````


````bash
######################################################
case "$1" in
  start)
    docker start Emby
    sleep 3
    ;;
  stop)
    docker stop Emby
    sleep 3
    ;;
  reload)
    docker stop Emby
    sleep 3
    docker start Emby
    ;;
  *)
   echo "Usage: $0 {start|stop|reload}"
   exit 1
   ;;
   
esac
exit 0
######################################################
````
