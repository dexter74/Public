````
{
// ---------------------------------------------------------------------
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




// ---------------------------------------------------------------------
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
}
````
