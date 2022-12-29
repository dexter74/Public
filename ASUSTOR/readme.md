---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'>Application ASUSTOR par Drthrax74</p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## I. Présentation
Le projet suivant à pour objectif, de faire des applications sous Docker avec l'image sur le portail ASUSTOR.
J'ai pu remarqué que certains conteneurs sont instables et peuvent plantés facilement.


**Problématique:** Les conteneurs ne se lance pas au démarrage de la machine.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## II. Etat d'avancement des conteneurs ([Squelette](https://github.com/dexter74/Public/blob/main/ASUSTOR/AppCentral/Squelette.md))

# Voir Pour la relance des conteneurs après reboot du NAS

<br />
<br />


| Network  |  Application  | Statut de l'application        |
| -------- | ------------- | ------------------------------ |
|  Host    | AdGuardHome   | En cours de révision           |
|  Bridge  | BitWarden     | Opérationnel [Release 1.0]     |
|  Bridge  | Cloud9        | Opérationnel [Release 1.0]     |
|  Bridge  | CodeServer    | Opérationnel [Release 1.0]     |
|  Bridge  | Dozzle        | Opérationnel [Release 1.0]     |
|  Bridge  | Emby 	        | Opérationnel [Release 1.0]     |
|  Bridge  | FileBrowser   | Opérationnel [Release 1.0]     |
|  Bridge  | MariaDB       | Opérationnel [Release 1.0]     |
|  Bridge  | NexClipper    | Opérationnel [Release 1.0]     |
|  Bridge  | Nginx         | Opérationnel [Release 1.0]     |
|  Bridge  | NordVPN       | En cours de test               |
|  Bridge  | phpMyAdmin    | Opérationnel [Release 1.0]     |
|  Bridge  | Plex          | Revoir Script sur la suppression [Release 1.0]     |
|  Bridge  | Portainer     | Opérationnel [Release 1.0]     |
|  Bridge  | QBitorrent    | Opérationnel [Alpha 1.0]       |
|  ??????  | Jackett       | A Faire                        |
|  ??????  | Jdownloader   | A Faire                        |
|  ??????  | Radarr        | A Faire                        |
|  ??????  | Sonarr        | A Faire                        |
|  ??????  | docker-ce     | A faire                        |
|  ??????  | Wireguard     | Module Wireguard.ko absent     |
|  ??????  | writl/pyload  | A faire                        |

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
wget https://downloadgb.asustor.com/developer/APKG_Utilities_2.0_0517.zip -O /tmp/APKG_Utilities_2.0_0517.zip;
unzip -o /tmp/APKG_Utilities_2.0_0517.zip -d /usr/bin;
chmod u+x  /usr/bin/apkg-*;
```


##### C. Pull Dépôt - Root Requis 

```console
clear;
cd;
rm -rf ~/APPZ
git clone https://github.com/dexter74/Public.git ~/APPZ
chmod -R 777 ~/APPZ
```

##### D. Création d'une Appz
```
rm /mnt/DL/APK/*.apk;
sh ./APPZ/ASUSTOR/AppCentral/start.sh;
mv ~/APPZ/ASUSTOR/AppCentral/*/*.apk .;
mkdir -p /mnt/DL/APK 2>/dev/null;
mv *.apk /mnt/DL/APK;
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
