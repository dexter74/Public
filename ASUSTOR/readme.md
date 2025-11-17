---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'>Application ASUSTOR par Drthrax74</p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## I. Présentation
Ce projet à pour objectif de construire des conteneurs prêt à l'emploie avec l'accès au partage Docker, Download, Video, Music. 

**Evolution**
```
https://docs.docker.com/compose/compose-file/compose-file-v2
device_read_bps, device_write_bps
device_read_iops, device_write_iops
weight
weight_device

[DOC] https://downloadgb.asustor.com/developer/App_Central_Developer_Guide_4.0.0_20210517.pdf
```

**ReverseProxy**
```
Un volume aléatoire est fait ! Un volume Fixe à été oublié à déclarer !
```
**Wireguard**
```
Volume à revoir
Configuration à revoir
```

**phpMyAdmin** (Erreur / Fix)
```
https://techoverflow.net/2018/08/15/how-to-fix-phpmyadmin-error-1231-variable-lc_messages-cant-be-set-to-the-value-of/
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## II. Etat d'avancement des conteneurs ([Squelette](https://github.com/dexter74/Public/blob/main/ASUSTOR/AppCentral/Squelette.md))

<br />

| Network  |  Application  | Statut de l'application                        | Observation           |  Port  |
| -------- | ------------- | ---------------------------------------------- | --------------------- | ------ |
|  ??????  | adminer       | En cours de test                               |                       |   1118 |
|  Host    | AdGuardHome   | Opérationnel [Release 1.0]                     | Aucune                |  3272  |
|  Bridge  | BitWarden     | Opérationnel [Release 1.0]                     | Aucune                |  7777  |
|  Bridge  | Cloud9        | Opérationnel [Release 1.0]                     | Lent à se lancer      |  1000  |
|  Bridge  | Dozzle        | Opérationnel [Release 1.0]                     | Aucune                |  1005  |
|  Bridge  | Emby 	       | Opérationnel [Release 1.0]                     | Aucune                |  8096  |
|  Bridge  | FileBrowser   | Opérationnel [Release 1.0]                     |                       |  1010  |
|  Bridge  | Jackett       | Opérationnel [Release 1.0]                     | En cours de test      |  1111  |
|  Bridge  | Jdownloader   | Opérationnel [Release 1.0]                     | En cours de test      |  3333  |
|  Bridge  | Librespeed    | Opérationnel [Release 1.0]                     | En cours de test      |  27016 |
|  Bridge  | MariaDB       | Opérationnel [Release 1.0]                     | Aucune                |  3306  |
|  Bridge  | NexClipper    | Opérationnel [Release 1.0]                     |                       |  10051 |
|  Bridge  | Nginx         | Opérationnel [Release 1.0]                     | Aucune                |  81    |
|  Bridge  | Nginx         | Opérationnel [Release 1.0]                     | Aucune                |  1443  |
|  Bridge  | phpMyAdmin    | Opérationnel [Release 1.0]                     |                       |  8081  |
|  Bridge  | Portainer     | Opérationnel [Release 1.0]                     |                       |  ????? |
|  Bridge  | Radarr        | Opérationnel [Release 1.0]                     | En cours de test      |  1112  |
|  Bridge  | Sonarr        | Opérationnel [Release 1.0]                     | En cours de test      |  1113  |
|  Bridge  | Visual_Studio | Opérationnel [Release 1.0]                     | CodeServer            |  8443  |
|  Bridge  | Jellyfin      | En cours de vérification                       | Aucune                |  8097  |
|  ------- | ------------- | ---------------------------------------------- | --------------------- | ------ |
|  Bridge  | NordVPN       | A configurer pour l'authentification           |                       |  ????? |
|  Bridge  | Crontab-ui    | alseambusher/crontab-ui                        | A faire de 0          |  ????? |
|  Bridge  | Plex          | Revoir Script sur la suppression [Release 1.0] |                       |  32400 |
|  Bridge  | QBitorrent    | En cours de Test [Release 1.0]                 | Config et catégorie   |  1110  |
|  ??????  | Wireguard     | Module Wireguard.ko absent                     |                       |  51820 |
|  ??????  | writl/pyload  | A faire                                        |                       |  ????? |
|  ??????  | Wiki.JS       | A faire                                        |                       |  ????? |
