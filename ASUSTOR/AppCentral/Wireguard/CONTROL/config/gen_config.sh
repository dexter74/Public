#########################################################
# Script de génération de la configuration de Wireguard #
#########################################################
source ./settings.conf

# Création du Dossier
mkdir /etc/wireguard 2>/dev/null;

# Clés Public et Privée
echo "$WIREGUARD_PUBLIC" > /etc/wireguard/publickey
echo "$WIREGUARD_PRIVATE" > /etc/wireguard/privatekey

echo "
################################################################################################################
# Configuration Serveur #
#########################
[Interface]
Address = $WIREGUARD_ADDR
ListenPort = $WIREGUARD_PORT
PrivateKey = $WIREGUARD_PRIVATE
################################################################################################################
# Pare-Feu #
############
PostUp     = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o $WIREGUARD_NET -j MASQUERADE
PostDown   = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o $WIREGUARD_NET -j MASQUERADE
################################################################################################################
# Clients #
###########
[Peer]
PublicKey  = $CLIENT1_PUBLIC
AllowedIPs = $CLIENT1_ALLOWIP

[Peer]
PublicKey  = $CLIENT2_PUBLIC
AllowedIPs = $CLIENT2_ALLOWIP

[Peer]
PublicKey  = $CLIENT3_PUBLIC
AllowedIPs = $CLIENT3_ALLOWIP
#############################################################################################################" > /etc/wireguard/wg0.conf
