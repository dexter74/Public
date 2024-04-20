#### Nano
```bash
Installer Entware
Puis taper la commande opkg install nano
```

#### Déclaration des variables
```bash
SOURCE='/share/User Homes/'
DESTINATION='/share/MyArchive1/User Homes/'
```

#### Déclaration des options
```bash
OPTION="-a -g -o -p -r -t -v -u -z --delete-before --progress"
```

```
##############################################################################################
# -a: Mode archivage
# -g: Préserve le groupe
# -o: Préserve le propriétaire
# -p: Préserve les permissions
# -r: Mode récursive
# -t: Préserve les dates
# -v: Mode Verbose
# -u: Ignorer les fichiers supplémentaires destination
# -z: Mode compression
# --delete-before : Supprime les fichiers absents de la source (Avant la synchronisation)
# --delete        : Miroir Parfait (Si fichier absent dans la destination, il sera supprimé)
# --dry-run       : Mode Test
# –exclude=MOTIF  : Extension Exclus
# --progress      : Affiche la barre de progression
##############################################################################################
```

#### Simulation de Sauvegarde
```bash
rsync $OPTION --dry-run "$SOURCE" "$DESTINATION";
```




#### Méthode 1:
```bash
#rm nohup.out;
#nohup rsync -avu --progress --delete $SOURCE $DESTINATION &
#tail -f nohup.out;
```

#### Méthode 2:
```bash
#rm myprogram.*;
#nohup rsync -avu --progress --delete $SOURCE $DESTINATION > myprogram.out 2> myprogram.err &
#tail -f myprogram.out;
#tail -f myprogram.err;
```

### Gestion de l'arrêt du processus
```bash
kill -s TERM $(pidof rsync);
kill -s TERM $(pgrep rsync);
kill -s kill $(pidof rsync);
```

#### Vérifier si le processus
```bash
ps | grep -v grep | grep  rsync;
```

#### Trouver processus qui tient le fichier
```bash
# L'indexation de Windows crée 1 processus / fichier trouver.
lsof | grep $DESTINATION;
fuser -k -TERM $DESTINATION;
fuser -m -k $DESTINATION;
```

------------------------------------------------------------------------------------------------------------------
#### Sauvegarde Externe
`Le processus de sauvegarde Externe se nommme: extbkagent et lance la sauvegarde Video.`

```bash
# Afficher le processus
ps | grep -v grep | grep extbkagent;

# Récupérer le PID Processus
pidof extbkagent;

# Envoi du signale d'arrêt du processsus (Propre)
kill -s TERM $(pidof extbkagent);

# Tuer le Processus
kill -s KILL $(pidof extbkagent);

# Relancer la sauvegarde (Ne pas mettre;)
nohup /usr/builtin/sbin/extbkagent VIDEO &

# liste des jobs:
jobs -l;

# Kill un jobs
jobs %n (n étant le numéro de jobs);
```

**Kill:**
```bash
1  - HUP qui permet de recharger un process
9  - KILL qui permet de tuer un process
15 - TERM qui permet de terminer proprement un process
```
