#################################################
# Script de de déploiement de Docker sur Debian #
#################################################

# Nettoyage de la console
clear;

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  clear;
  echo 'Merci de preciser un parametre
  - VARIABLE                          # Si le système à pas la variable
  - PURGE                             # Désinstalle Proprement Docker
  - PREP                              # Paquet indispensable pour installer docker
  - INSTALL                           # Installation de Docker et Docker-compose
  - FIX                               # Corrige les bugs Post-Install de Linux
  - HUB <Login> <PASS>                # Connexion au HUB
  - TEST                              # Conteneur Hello-World pour le test de fonctionnalité
  - KILL                              # Tue tous les conteneurs
  - PORTAINER 8000 19901 32m          # Kill, Purge le conteneur Portainer avec son volume et le réinstalle.
  - PORTAINER_UPDATE 8000 19901 32m   # Kill, Purge le conteneur Portainer avec son IMAGE puis le recrée.
  - LOCK                              # Vérrouillage du volume Portainer
  - UNLOCK                            # Dévérrouillage du volume Portainer
  - STATS                             # 
  - VERSION                           #
  '
  
# ---------------------------------------------------------------------------------------------------------------------------------------------
#  1>/dev/null 2>/dev/null;
 elif [ "$1" = "VARIABLE" ]
  then
   clear;
   export RELEASE=buster

# ---------------------------------------------------------------------------------------------------------------------------------------------
#  1>/dev/null 2>/dev/null;
 elif [ "$1" = "PURGE" ]
  then
   clear;
   apt autoremove --purge -y docker-ce docker-ce-cli containerd.io;
   rm -rf /var/lib/containerd;
   rm -rf /etc/docker;
   rm -rf /usr/local/bin/docker-compose;
   #rm -rf /var/lib/docker;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Mise à jour Dépôt, Installation des pré-requis et ajout du dépôts docker.
 elif [ "$1" = "PREP" ]
  then
  clear;
  apt update;
  apt install -qq -y apt-transport-https ca-certificates gnupg-agent gnupg2 software-properties-common sudo curl;
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -;
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $RELEASE stable";

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "INSTALL" ]
  then
  clear;
  apt install -qq -y docker-ce docker-ce-cli containerd.io;
  curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
  chmod +x /usr/local/bin/docker-compose;
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
  #systemctl reboot; # Requis pour eviter l'erreur "Your kernel does not support swap memory limit"

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "FIX" ]
  then
  clear;
  echo deb http://deb.debian.org/debian $RELEASE-backports main contrib non-free | sudo tee /etc/apt/sources.list.d/backports.list;
  apt update;
  apt install -y -t $RELEASE-backports linux-image-amd64;
  apt install -y -t $RELEASE-backports firmware-linux firmware-linux-nonfree;
  rm /etc/apt/sources.list.d/$RELEASE-backports.list;
  apt update;
  systemctl reboot;

# ---------------------------------------------------------------------------------------------------------------------------------------------
#  Connexion au Docker-Hub ($2: login | $3: Password)
 elif [ "$1" = "HUB" ]
  then
  clear;
  docker login -u $2 -p $3;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "TEST" ]
  then
  clear;
  docker run --name=TEST hello-world;
  docker container rm TEST;
  docker image rm hello-world;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "KILL" ]
  then
  clear;
  docker kill $(docker ps -q);
  docker rm $(docker ps -a -q);
  docker rmi $(docker images -q);

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "STATS" ]
  then
  clear;
  docker stats --format "table  {{.Name}}\t {{.CPUPerc}}\t  {{.MemPerc}}\t  {{.MemUsage}}\t {{.NetIO}}\t {{.BlockIO}}\t";

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Déploiement de Portainer (journalctl -f | grep "cgroup\|swap\|docker")
 elif [ "$1" = "PORTAINER" ]
  then
  clear;
  docker kill CN_Portainer;
  docker container rm CN_Portainer;
  docker image  rm portainer/portainer-ce;
  docker volume rm Portainer;
  docker run -d -p $2:8000 -p $3:9000 \
   --name=CN_Portainer \
   --restart=always \
   --label Portainer="hide" \
   -m $4 \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v Portainer:/data \
   portainer/portainer-ce \
   --hide-label \
   Portainer="hide";

# ---------------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PORTAINER_UPDATE" ]
  then
  clear;
  docker kill CN_Portainer;
  docker container rm CN_Portainer;
  docker image  rm portainer/portainer-ce;

  docker run -d -p $2:8000 -p $3:9000 \
   --name=CN_Portainer \
   --restart=always \
   --label Portainer="hide" \
   -m $4 \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v Portainer:/data \
   portainer/portainer-ce \
   --hide-label \
   Portainer="hide";

# ---------------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "LOCK" ]
  then
  clear;
  chattr +i /var/lib/docker/volumes/Portainer;

# ---------------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "UNLOCK" ]
  then
  clear;
  chattr -i /var/lib/docker/volumes/Portainer;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "VERSION" ]
  then
  clear;
  docker --version;
  docker-compose --version;

# ---------------------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
# ---------------------------------------------------------------------------------------------------------------------------------------------
fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

# Défaut   : /var/lib/docker/volumes
# Service  : nano /lib/systemd/system/docker.service;
# Editer   : ExecStart=/usr/bin/dockerd --data-root '/home/docker' -H fd:// --containerd=/run/containerd/containerd.sock
# systemctl daemon-reload;
# systemctl restart docker*;
# docker info | grep "Docker Root"
