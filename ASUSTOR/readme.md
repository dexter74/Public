---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'>Application ASUSTOR par Drthrax74</p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## I. Présentation
Ce projet à pour objectif de construire des conteneurs prêt à l'emploie avec l'accès au partage Docker, Download, Video, Music. 


**Version: 1.0** (Problème)
```
Les conteneurs ne veulent pas se relancé après le redémarrage du NAS. 
Le conteneur Base et le squelette est à modifier .
docker create -i -t \
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## II. Etat d'avancement des conteneurs ([Squelette](https://github.com/dexter74/Public/blob/main/ASUSTOR/AppCentral/Squelette.md))

<br />

| Network  |  Application  | Statut de l'application        | Observation                           |  Port  |
| -------- | ------------- | ------------------------------ | ------------------------------------- | ------ |
|  Host    | AdGuardHome   | Opérationnel [Release 1.0]     |  Aucune                               |  3272  |
|  Bridge  | BitWarden     | Opérationnel [Release 1.0]     |  Aucune                               |  7777  |
|  Bridge  | Cloud9        | Opérationnel [Release 1.0]     |  Lent à se lancer                     |  1000  |
|  Bridge  | Dozzle        | Opérationnel [Release 1.0]     |  Aucune                               |  1005  |
|  Bridge  | Emby 	        | Opérationnel [Release 1.0]     |  Aucune                               |  8096  |
|  Bridge  | FileBrowser   | Opérationnel [Release 1.0]     |                                       |  1010  |
|  Bridge  | Jackett       | Opérationnel [Release 1.0]     | En cours de test                      |  1111  |
|  Bridge  | Jdownloader   | Opérationnel [Release 1.0]     | En cours de test                      |  3333  |
|  Bridge  | Librespeed    | Opérationnel [Release 1.0]     | En cours de test                      |  27016 |
|  Bridge  | MariaDB       | Opérationnel [Release 1.0]     |  Aucune                               |  3306  |
|  Bridge  | NexClipper    | Opérationnel [Release 1.0]     |                                       |  10051 |
|  Bridge  | Nginx         | Opérationnel [Release 1.0]     |  Aucune                               |   81   |
|  Bridge  | NordVPN       | A configurer pour l'authentification |                                 | ------ |
|  Bridge  | phpMyAdmin    | Opérationnel [Release 1.0]     |                                       |  8081  |
|  Bridge  | Plex          | Revoir Script sur la suppression [Release 1.0] |                       |  32400 |
|  Bridge  | Portainer     | Opérationnel [Release 1.0]     |                                       | ?????? |
|  Bridge  | QBitorrent    | En cours de Test [Release 1.0] |  Aucune                               |  1110  |
|  Bridge  | Radarr        | Opérationnel [Release 1.0]     | En cours de test                      |  1112  |
|  Bridge  | Sonarr        | Opérationnel [Release 1.0]     | En cours de test                      |  1113  |
|  Bridge  | Visual_Studio | Opérationnel [Release 1.0]     | CodeServer                            |  8443  |
|  ??????  | Wireguard     | Module Wireguard.ko absent     |                                       | ?????? |
|  ??????  | writl/pyload  | A faire                        |                                       | ?????? |
|  ??????  | Wiki.JS       | A faire                        |                                       | ?????? |

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
```
su;
apt install -y git
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
rm -rf ./APPZ;
git clone https://github.com/dexter74/Public.git ./APPZ;
```

##### D. Création d'une Appz
```
rm -f /mnt/Download/APK/*.apk
sh ./APPZ/ASUSTOR/AppCentral/start.sh;
mv ./APPZ/ASUSTOR/AppCentral/*/*.apk /mnt/Download/APK/;
```

##### E. Volumes
```
ls -l "/volume1/.@plugins/AppCentral/docker-ce/docker_lib/volumes/" | cut -d ":" -f 2 | cut -c 4-80
```

##### F. Nettoyage du Système
```
docker images prune -a
docker volume prune -f
docker image  prune -a -f
docker system prune -a -f
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
