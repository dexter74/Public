##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
CONTAINER_NAME=Emby
HTTP=8096:8096
HTTPS=8920:8920

docker run -d --name=$CONTAINER_NAME --net=host emby/embyserver:latest
