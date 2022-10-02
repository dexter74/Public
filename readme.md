### Pull Dépôt
```
clear;
cd;
rm -r /root/Public;
git clone https://github.com/dexter74/Public.git /root/Public;
cd ~/Public/ASUSTOR/AppCentral/Plex       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Portainer  && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Emby       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
```

| Application | Statut  |
|-------------|-------- |
| Plex        | Parfait |
| Portainer   | Parfait |




[PDF](https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.1.0_20220622.pdf)

[Guide](https://amigotechnotes.wordpress.com/2014/05/06/how-to-create-an-apk-for-asustor-adm-to-distribute-your-lamp/)


```json
{
	"general": {
		"package": "MonPackage",
		"name": "AppCentral",
		"version": "1.0",
		"depends": [
			"docker-ce(>=20.10.2.r2)"
		],
		"developer": "Marc Jaffré",
		"maintainer": "Drthrax74",
		"email": "teste74@hotmail.fr",
		"website": "http://localhost",
		"architecture": "x86-64",
		"firmware": "4.1.0",
		"model": "53xx",
		"default-lang": "fr-FR",
		"memory-limit": "2048",
		"memory-advice": "2000",
		"privacy-statement": "http://localhost/privacy.html"
	},

	"adm-desktop": {
		"app": {
			"type": "custom",
			"session-id": "false",
			"protocol": "http",
			"port": "8080",
			"url": "/"
		},
		"privilege": {
			"accessible": "users",
			"customizable": "true"
		}
	},
	"register": {
		"port": [
			"9000, 5000"
		],
		"share-folder": [{
			"name:": "Video",
			"description": "Partage Video"
		}]
	},
	"prerequisites": {
		"enable-service": [
			"httpd"
		],
		"restart-service": [
			""
		]
	},
	"boot-priority": {
		"start-order": 95,
		"stop-order": 5
	}
}
```
