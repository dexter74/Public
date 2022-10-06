### Script Python 
```
wget https://downloadgb.asustor.com/developer/APKG_Utilities_2.0_0517.zip -O /tmp/APKG_Utilities_2.0_0517.zip
unzip -o /tmp/APKG_Utilities_2.0_0517.zip -d /usr/bin 
chmod u+x  /usr/bin/apkg-*
```


### Pull Dépôt ([Squelette](https://github.com/dexter74/Public/blob/main/ASUSTOR/AppCentral/Squelette.md))
```
clear;
rm -r /root/Public;
git clone https://github.com/dexter74/Public.git /root/Public;
```

### Modifier les permissions
```
chown -R 777 /root/Public;
```



### Création d'une Appz
```
cd /root/Public/ASUSTOR/AppCentral/AdGuardHome && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Cloud9 && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Emby && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Jackett && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Jdownloader && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Plex && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Portainer && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/QBitorrent && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Radarr && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/ReverseProxy && apkg-tools_py2.py create .
cd /root/Public/ASUSTOR/AppCentral/Sonarr && apkg-tools_py2.py create .

#Dossier Partage (Host / Guest) 
mv ~/Public/ASUSTOR/AppCentral/*/*.apk /mnt/LAMP;
```


| Application  | Statut de l'application        |
|------------- | ------------------------------ |
| AdGuardHome  | A Faire                        |
| Cloud9       | A faire                        |
| Emby 	       | Opérationnel                   |
| Jackett      | A Faire                        |
| Jdownloader  | A Faire                        |
| Plex         | Opérationnel                   |
| Portainer    | Opérationnel                   |
| QBitorrent   | OK (A changer Host en Bridge)  |
| Radarr       | A Faire                        |
| ReverseProxy | A Faire                        |
| Sonarr       | A Faire                        |



#### Problème Icône:
```
Le JSON a un espace qui pose problème. (Version)
```

Liens utiles:
 - [PDF AppCentral Dev ASUSTOR](https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.1.0_20220622.pdf)
 - [Guide Création](https://amigotechnotes.wordpress.com/2014/05/06/how-to-create-an-apk-for-asustor-adm-to-distribute-your-lamp/) 
 - [Privée] [Dexter74/Docker](https://github.com/dexter74/Archives/tree/main/Docker/V1/2.Conteneurs)
