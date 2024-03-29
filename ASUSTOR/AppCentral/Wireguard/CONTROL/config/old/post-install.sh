#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTENEUR=Wireguard
IMAGE=linuxserver/wireguard
RESTART=unless-stopped
PORT=51820:51820/UDP

IP_NAS=$(ip add   | grep 192.168.0 | cut -d "/" -f 1 | cut -c 10-30)
IP_GW=$(ip  route | grep default   | cut -d "a" -f 3 | cut -c 2-12)
IP_DNS=$(cat /etc/resolv.conf | head -n 1 | cut -c 12-25)
INTERFACE=$(ip add |  grep -A0 $IP_NAS | cut -d "l" -f 3 | cut -c 2-25)

USER_ID=$(cat  /etc/passwd | tail -n 6 | head -n 1 | cut -d ":" -f 3)
USER_GID=$(cat /etc/passwd | tail -n 6 | head -n 1 | cut -d ":" -f 4)

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f $CONTENEUR;
rm -rf /share/Docker/$CONTENEUR 2>/dev/null;

##########################################################################################################################################################
# Prise en charge du Forwading #
################################
# Defaut
echo "net.ipv4.neigh.default.gc_thresh1 = 512
net.ipv4.neigh.default.gc_thresh2 = 2048
net.ipv4.neigh.default.gc_thresh3 = 4096" > /etc/sysctl.conf;
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf;
sysctl -p;


##########################################################################################################################################################
# Mise en place de la configuration #
#####################################
mkdir -p /share/Docker/$CONTENEUR 2>/dev/null;
sed -e "/eth1/$INTERFACE/g" /usr/local/AppCentral/Wireguard/CONTROL/config/wg0.conf
mv /usr/local/AppCentral/Wireguard/CONTROL/config/privatekey /share/Docker/$CONTENEUR 2>/dev/null;
mv /usr/local/AppCentral/Wireguard/CONTROL/config/publickey  /share/Docker/$CONTENEUR 2>/dev/null;
mv /usr/local/AppCentral/Wireguard/CONTROL/config/wg0.conf   /share/Docker/$CONTENEUR 2>/dev/null; 
sleep 2


##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker create -i -t                                                    \
--name=$CONTENEUR                                                      \
--hostname $CONTENEUR                                                  \
--net=host                                                             \
--dns $IP_DNS                                                          \
--restart $RESTART                                                     \
--env PUID="$USER_ID"                                                  \
--env PGID="$USER_GID"                                                 \
--env TZ="EUROPE\PAris"                                                \
--cap-add="NET_ADMIN"                                                  \
--cap-add="SYS_MODULE"                                                 \
--sysctl net.ipv4.conf.all.src_valid_mark=1                            \
--volume /share/Docker/Wireguard/privatekey:/config/privatekey         \
--volume /share/Docker/Wireguard/publickey:/config/publickey           \
--volume /share/Docker/Wireguard/wg0.conf:/config/wg0.conf             \
--volume /usr/local/AppCentral/adm-kernel-extensions/lib/:/lib/modules \
--label cacher="non"                                                   \
$IMAGE:latest

#--publish $PORT                                                        \
# --cap-add="SYS_MODULE" \
#--sysctl net.ipv4.conf.all.src_valid_mark=1                            \
#--sysctl net.ipv4.ip_forward=1                                         \
#--volume /volume1/Docker/$CONTENEUR:/config                            \


##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

# docker exec -it Wireguard sh

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0
