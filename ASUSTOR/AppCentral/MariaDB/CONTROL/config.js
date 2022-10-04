{
"general":{ 
  "package":"MariaDB", 
  "name":"MariaDB", 
  "version":"1.0", 
  "depends": [ 
    "docker-ce(>=20.10.2.r2)"], 
    "conflicts":"", 
    "developer":"MariaDB Corporation", 
    "maintainer":"MariaDB.", 
    "email":"support@mariadb.com", 
    "website":"https://mariadb.com/", 
    "architecture":"x86-64", 
    "firmware":"4.1.0", 
    "default-lang":"fr-FR",
    "privace-statement":"https://mariadb.com/fr/privacy-policy/" },
"adm-desktop":{
  "app":{ 
    "port":"3306"
  },
	  
"register":{
	"symbolic-link":{},
	"share-folder":[{ "name":"Docker","description":"Partage Docker requis"}],
	"port":[ "3306" ],
	"boot-priority":[{ "start-order":"65", "stop-order":"9" }],
	"prerequisites":{  "enable-service":[], "restart-service":[] }
	}
}
