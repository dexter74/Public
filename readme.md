---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'>Application ASUSTOR par Drthrax74</p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## I. Présentation
Le projet suivant à pour objectif, de faire des applications sous Docker avec l'image sur le portail ASUSTOR.
J'ai pu remarqué que certains conteneurs sont instables et peuvent plantés facilement.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## II. Etat d'avancement des conteneurs ([Squelette](https://github.com/dexter74/Public/blob/main/ASUSTOR/AppCentral/Squelette.md))

### Information importante: Les conteneurs vont migrer sur le réseau Bridge à terme pour une gestion plus simple


| Network      | Application  | Statut de l'application        |
| ------------ | ------------ | ------------------------------ |
|     Host     | AdGuardHome  | Opérationnel (A migrer)		   |
|     Host     | Emby 	      | Opérationnel (A migrer)		   |
|     Host     | MariaDB      | Opérationnel (A migrer)		   |
|     Host     | Plex         | Opérationnel (A migrer)		   |
|     Host     | Portainer    | Opérationnel (A migrer)		   |
|     Host     | ReverseProxy | Opérationnel (A migrer)		   |
|     Host     | QBitorrent   | Opérationnel (A migrer)		   |
| ???????????  | phpMyAdmin   | A faire                        |
| ???????????  | BitWarden    | A faire                        |
| ???????????  | Cloud9       | A faire                        |
| ???????????  | Jackett      | A Faire                        |
| ???????????  | Jdownloader  | A Faire                        |
| ???????????  | Radarr       | A Faire                        |
| ???????????  | Sonarr       | A Faire                        |



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
su
rm -rf /usr/bin/apkg-*
wget https://downloadgb.asustor.com/developer/APKG_Utilities_2.0_0517.zip -O /tmp/APKG_Utilities_2.0_0517.zip
unzip -o /tmp/APKG_Utilities_2.0_0517.zip -d /usr/bin 
chmod u+x  /usr/bin/apkg-*
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
sh ./APPZ/ASUSTOR/AppCentral/start.sh
mv ~/APPZ/ASUSTOR/AppCentral/*/*.apk .
ls *.apk
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Liens utiles:
 - [PDF AppCentral Dev ASUSTOR](https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.1.0_20220622.pdf)
 - [Guide Création](https://amigotechnotes.wordpress.com/2014/05/06/how-to-create-an-apk-for-asustor-adm-to-distribute-your-lamp/) 
 - [Privée] [Dexter74/Docker](https://github.com/dexter74/Archives/tree/main/Docker/V1/2.Conteneurs)
