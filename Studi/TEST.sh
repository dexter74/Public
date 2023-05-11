GROUPE_1='supervision'
GROUPE_2='docker'
COMPTE_1_USER='marc'
PASSWD_1_PASS='admin'
COMPTE_2_USER='docker'
PASSWD_2_PASS='admin123456'
COMPTE_1_HOME='/home/$COMPTE_1_USER'
COMPTE_2_HOME='/home/$COMPTE_2_USER'
SHELL='/bin/bash'
HOST_NAME='sldebian02'
HOST_DOMAINE='LAN'
INTERFACE_NAME='ens18'
INTERFACE_ADDRESS='192.168.1.5'
INTERFACE_MASK='255.255.255.0'
INTERFACE_BROADCAST='192.168.1.255'
INTERFACE_GATEWAY='192.168.1.1'
INTERFACE_DNS='192.168.1.1'
INTERFACE_DOMAINE='LAN'
HOST_TIMEZONE_REGION='Europe'
HOST_TIMEZONE_VILLE='Paris'
HOST_LANGUE='fr_FR.UTF-8'
OS_SOURCE='http://ftp.fr.debian.org/debian'
OS_RELEASE='buster'
OS_RELEASE_BRANCHE='main contrib non-free'
KEY_SSH_WINDOWS=''


echo "" > /etc/hostname ;
echo "" > /etc/hosts ;
echo "" > /etc/network/interfaces ;
echo "" > /etc/sysctl.d/70-disable-ipv6.conf ;
sed -i -e 's/#deb cdrom/deb cdrom/g' /etc/apt/sources.list ;
rm /etc/apt/sources.list.d/$OS_RELEASE-backports.list ;
rm 0.sh ;nano 0.sh ; sh 0.sh


#####################
# STEP_A0: Hostname #
#####################
#Obtenir le RC (grep "$HOST_NAME" /etc/hostname; echo $?)
grep "$HOST_NAME" /etc/hostname
if [ $? = 0 ]
 then
 echo "RC = 0 (OK)"
 STEP_A0=0
else
 echo "$HOST_NAME" > /etc/hostname
 echo "RC 1 (KO)"
 STEP_A0=1
fi

##################
# STEP_A1: Hosts #
##################
# STEP_A0=0
#Obtenir le RC (grep "$HOST_NAME" /etc/hosts; echo $?)
grep "$HOST_NAME" /etc/hosts

if [ $? = 0 ]
 then
  echo "RC = 0 (OK)"
  STEP_A1=0
else
echo "#IPV4
127.0.0.1       localhost
127.0.1.1       $HOST_NAME     $HOST_NAME
#127.0.1.1       $HOST_NAME.$HOST_DOMAINE     $HOST_NAME
#IPV6
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" > /etc/hosts
echo "RC 1 (KO)"
STEP_A1=1
fi

#############################
# STEP_A2: Interface Réseau #
#############################
# STEP_A0=0
# STEP_A1=0

if grep -q "static" /etc/network/interfaces
then
echo "RC = 0 (OK)"
STEP_A2=0
else
echo "auto lo
iface lo inet loopback
auto $INTERFACE_NAME
allow-hotplug $INTERFACE_NAME
iface $INTERFACE_NAME inet static
address $INTERFACE_ADDRESS
netmask $INTERFACE_MASK
broadcast $INTERFACE_BROADCAST
gateway $INTERFACE_GATEWAY
dns-nameservers $INTERFACE_DNS" > /etc/network/interfaces ;
echo "dns-search $INTERFACE_DOMAINE" >> /etc/network/interfaces ;
echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/70-disable-ipv6.conf ;
echo "RC = 1 (KO)"
STEP_A2=1
fi

##################################
# STEP_A3: Paquets indispensable #
##################################
# STEP_A0=0
# STEP_A1=0
# STEP_A2=0
if grep -q "#deb cdrom" /etc/apt/sources.list
 then
 echo "OK"
 STEP_A3=0
else
 echo "RC = 1 (KO)"
 sed -i -- 's/deb cdrom/#deb cdrom/g' /etc/apt/sources.list ;
 STEP_A3=1 
fi

##################################
# STEP_A4: Paquets indispensable #
##################################
# STEP_A0=0
# STEP_A1=0
# STEP_A2=0
# STEP_A3=0

if [ $STEP_A3 = "0" ] && grep -q "backports" /etc/apt/sources.list.d/$OS_RELEASE-backports.list && grep -q "debian" /etc/apt/sources.list.d/cloud_init.list
then
echo "OK"
STEP_A4=0
else
echo "deb $OS_SOURCE $OS_RELEASE-backports $OS_RELEASE_BRANCHE" > /etc/apt/sources.list.d/$OS_RELEASE-backports.list ;
echo "deb http://ftp.de.debian.org/debian $OS_RELEASE main" > /etc/apt/sources.list.d/cloud_init.list ;
apt update -qq ;
apt upgrade -y -qq ;
apt install -y -qq bash-completion  ; # Auto Complétion du BASH
apt install -y -qq curl             ; # Test URL
apt install -y -qq debconf-utils    ; # Outils popur reconfigurer paquets.
apt install -y -qq dnsutils         ; # Outils DNS
apt install -y -qq git              ; # Outil GIT
apt install -y -qq gnupg            ; #
apt install -y -qq net-tools        ; # Outils Réseau
apt install -y -qq sudo             ; # Administration
apt install -y -qq wget             ; # Téléchargement
apt install -y -qq cloud-init       ; #
apt install -y -qq qemu-guest-agent ; #
apt update --fix-missing -y         ; #
apt install -y -qq cifs-utils       ; #
apt install -y -qq ntfs-3g          ; #
apt install -y -qq samba            ; #
apt install -y -qq smbclient        ; #
echo "RC = 1 (KO)"
STEP_A3=0
STEP_A4=1
fi




###########################
# STEP_A4: Montage Volume #
###########################

###########################
# STEP_A5: Users & Groups #
###########################






clear ;
echo "    ####################"
echo "--- Compte Rendu des Jobs ---"
echo "    ####################"
echo "Step 0: $STEP_A0"
echo "Step 1: $STEP_A1"
echo "Step 2: $STEP_A2"
echo "Step 3: $STEP_A3"
echo "Step 4: $STEP_A4"


