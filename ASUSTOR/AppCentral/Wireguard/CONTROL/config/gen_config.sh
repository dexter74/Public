#########################################################
# Script de génération de la configuration de Wireguard #
#########################################################
source ./settings



# Création du Dossier
mkdir /etc/wireguard 2>/dev/null;

# Clé Public 
echo "" > /etc/

# Clé Privée
echo "" > /etc/

echo "
#############################################################################################################
# Configuration Serveur #
#########################
[Interface]
Address = $SRV_WG_ADDRESS
ListenPort = $SRV_WG_PORT
PrivateKey = $SRV_WG_PRIVATE

#############################################################################################################
# Pare-Feu #
############
PostUp     = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o $INTEFACE -j MASQUERADE
PostDown   = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o $INTEFACE -j MASQUERADE

#############################################################################################################
# Clients #
###########
[Peer]
PublicKey  = $CL1_WG_PUBLIC
AllowedIPs = $CL1_WG_ALLOW

#############################################################################################################" > /etc/wireguard/wg0.conf
