{
"general":{ 
  "package":"MariaDB", 
  "name":"MariaDB", 
  "version":"1.0", 
  "depends": [ 
    "docker-ce(>=20.10.2.r2)"], 
    "conflicts":"", 
    "developer":"MariaDB Corporation", 
    "maintainer":"MariaDB", 
    "email":"support@mariadb.net", 
    "website":"https://mariadb.com", 
    "architecture":"x86-64", 
    "firmware":"4.1.0", 
    "privace-statement":"https://mariadb.com › privacy-policy" },
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
