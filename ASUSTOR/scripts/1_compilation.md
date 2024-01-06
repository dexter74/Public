
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Création des Appz sur une machine Debian
##### A. Présentation
```
Une machine linux qui servira à concevoir les applications du NAS. (Recommande: Debian)
Le binaire wget sert à télécharger un contenu
Le binaire unzip sert à décompresser le fichier compressé.
Le binaire chmod permet de modifier les permissions sur les scripts python pour rendre celui-ci exécutables
Le binaire git permet de télécharger les sources qui est contenus dans ce dépôt.
Le binaire cd permet de se déplacer dans l'arborescence des dossiers.
```

##### B. Installer les Packages Requis
```bash
clear;
apt install -y git   1>/dev/null;
apt install -y unzip 1>/dev/null;
apt install -y wget  1>/dev/null;
```


##### B. Télécharger les Scripts Python ASUSTOR (Root Requis)
```console
clear;
rm -rf /usr/bin/apkg-*;
wget --inet4-only https://downloadgb.asustor.com/developer/APKG_Utilities_2.0_0517.zip -O /tmp/APKG_Utilities_2.0_0517.zip;
unzip -o /tmp/APKG_Utilities_2.0_0517.zip -d /usr/bin;
chmod u+x  /usr/bin/apkg-*;
```


##### C. Pull Dépôt - Root Requis 

```console
clear;
cd;
rm -rf ~/APPZ;
git clone https://github.com/dexter74/Public.git ~/APPZ 2>/dev/null;
```

##### D. Création d'une Appz
```bash
clear;
rm -f /mnt/Download/APK/*.apk,
sh ~/APPZ/ASUSTOR/AppCentral/start.sh;
mv ~/APPZ/ASUSTOR/AppCentral/*/*.apk /mnt/Download/APK/;
rm -rf ~/APPZ;
```

##### E. Volumes
```bash
clear;
ls -l "/volume1/.@plugins/AppCentral/docker-ce/docker_lib/volumes/" | cut -d ":" -f 2 | cut -c 4-80
```

##### F. Nettoyage du Système
```bash
clear;
docker images prune -a
docker volume prune -f
docker image  prune -a -f
docker system prune -a -f
```

##### G. Configuration de docker
```
/volume1/.@plugins/AppCentral/docker-ce/CONTROL/config.json
```

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
<p align='center'> cd /usr/local/AppCentral/ </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ![image](https://user-images.githubusercontent.com/35907/193457835-68095cc1-2a77-458c-8b93-b9105c103d2f.png)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Utiles:
 - 
 - [PDF AppCentral Dev ASUSTOR](https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.1.0_20220622.pdf)
 - [Guide Création](https://amigotechnotes.wordpress.com/2014/05/06/how-to-create-an-apk-for-asustor-adm-to-distribute-your-lamp/) 
 - [Privée] [Dexter74/Docker](https://github.com/dexter74/Archives/tree/main/Docker/V1/2.Conteneurs)
