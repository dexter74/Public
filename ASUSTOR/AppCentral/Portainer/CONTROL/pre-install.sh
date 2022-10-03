#!/bin/sh

# Fermeture du conteneur
docker container rm -f Portainer

# Téléchargement de l'image
docker pull portainer/portainer-ce
