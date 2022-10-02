##### Pull Dépôt
```
clear;
cd;
rm -r /root/Public;
git clone https://github.com/dexter74/Public.git /root/Public;
cd ~/Public/ASUSTOR/AppCentral/Plex       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Portainer  && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
cd ~/Public/ASUSTOR/AppCentral/Emby       && apkg-tools_py2.py create . && mv ./*.apk /mnt/LAMP;
```

| Application | Etat de l'application |
|-------------|-----------------------|
| Portainer   | Opérationnel          |
