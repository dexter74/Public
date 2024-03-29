--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place du partage samba </p>


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Configuration de la carte-réseau
```bash
clear;
# ------------------------------------------------------------------------------
NET=$(ip link | grep "2: " | cut -d ":" -f 2 | cut -c 2-10)
IP=192.168.1.19
MASK=255.255.255.0
GW=192.168.1.1
DNS1=192.168.1.1
DNS1=8.8.8.8
# ------------------------------------------------------------------------------
apt install -y resolvconf 1>/dev/null;
# ------------------------------------------------------------------------------
# apt install -y ifupdown2 1>/dev/null;
# ------------------------------------------------------------------------------
echo "##########################################
source /etc/network/interfaces.d/*
##########################################
# Adresse de bouclage
auto lo
iface lo inet loopback
##########################################
# Interface principale en Statique
auto ${NET}
allow-hotplug ${NET}
iface ${NET} inet static
 address ${IP}
 netmask ${MASK}
 gateway ${GW}
 dns-nameservers ${DNS1} ${DNS2}
##########################################" > /etc/network/interfaces;
# ------------------------------------------------------------------------------
cat /etc/network/interfaces;
# ------------------------------------------------------------------------------
systemctl restart networking;
```
<br />


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Déploiement de Samba
#### A. Installation de Samba
```bash
clear;
apt install -y samba        1>/dev/null;
apt install -y samba-common 1>/dev/null;
```


#### B. Gestion des accès Samba
```bash
clear;

# Définir ID
ID=1000

# Nom de compte
USERNAME=$(id -n -u $ID)

# Mot de passe du compte
PASSWORD=admin

# Définir aucun mot de passe
smbpasswd -n $USERNAME;

# Désactiver Utilisateur
smbpasswd -d $USERNAME;

# Supprimer Utilisateur
smbpasswd -x $USERNAME;
# Ajouter Utilisateur
(echo "$PASSWORD"; echo "$PASSWORD") | smbpasswd -a $USERNAME;

# Activer Utilisateur
smbpasswd -e $USERNAME;

# Lister les utilisateurs
pdbedit -L;
```

#### Configuration de Samba
```
clear;
cp /etc/samba/smb.conf /etc/samba/smb.conf.old;

echo "[global]
## Browsing/Identification ###
   workgroup = WORKGROUP
   client min protocol = SMB2
   client max protocol = SMB3

#### Networking ####

#### Debugging/Accounting ####
   log file = /var/log/samba/log.%m
   max log size = 1000
   logging = file
   panic action = /usr/share/samba/panic-action %d

####### Authentication #######
   server role = standalone server
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change = yes
   map to guest = bad user

# ======================= Share Definitions =======================
[homes]
comment        = Dossier Utilisateurs
browseable     = no
read only      = no
writable       = yes
create mask    = 0700
directory mask = 0700
guest ok       = no
valid users    = %S

[SYSTEM]
comment        = Acces au dossier Système
path           = /
browseable     = yes
writable       = yes
read only      = no
valid users    = marc
force user     = root
guest ok       = no


[root]
comment        = Acces au dossier root
path           = /root
browseable     = yes
writable       = yes
read only      = no
valid users    = marc
force user     = root
guest ok       = no

# ==================================================================
;   write list = root, @lpadmin
# ================================================================== " > /etc/samba/smb.conf;

testparm -s /etc/samba/smb.conf;
systemctl restart smbd;
```



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Déploiement de WSDD
#### A. Permettre la découverte réseau sous Windows
```bash
clear;
echo "deb http://ftp.de.debian.org/debian sid main" > /etc/apt/sources.list.d/sid.list;
apt update 1>/dev/null;
apt install --no-install-recommends -t sid wsdd 1>/dev/null;
rm /etc/apt/sources.list.d/sid.list;
apt update 1>/dev/null;
```

#### B. Gestions des services
```bash
clear;
systemctl restart wsdd;
systemctl enable wsdd;
```
