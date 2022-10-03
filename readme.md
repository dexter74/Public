### Pull Dépôt ([PDF](https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.1.0_20220622.pdf) | [Guide](https://amigotechnotes.wordpress.com/2014/05/06/how-to-create-an-apk-for-asustor-adm-to-distribute-your-lamp/))

```
clear;
cd;
rm -r /root/Public;
git clone https://github.com/dexter74/Public.git /root/Public;
cd ~/Public/ASUSTOR/AppCentral/Plex       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Portainer  && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Emby       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
```

| Application  | Statut de l'application     |
|------------- | --------------------------- |
| Emby 	       | Opérationnel et logo KO     |
| Plex         | Opérationnel et logo KO     |
| Portainer    | Opérationnel et logo KO     |
| Cloud 9      | A faire                     |
| ReverseProxy | A Faire                     |
| QBitorrent   | A Faire                     |
| jackett      | A Faire                     |
| Radarr       | A Faire                     |
| Sonarr       | A Faire                     |
| Jdownloader  | A Faire                     |
