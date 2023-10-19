echo "clear;
docker start AdGuardHome;
docker start qBittorrent;
docker start Emby;
docker start MariaDB;
docker start ReverseProxy;
docker start bitwarden;" > docker_start.sh

echo "clear;
docker stop bitwarden;
docker stop ReverseProxy;
docker stop MariaDB;
docker stop qBittorrent;
docker stop Emby;
docker stop AdGuardHome;" > docker_stop.sh

sh /usr/local/AppCentral/docker-ce/CONTROL/pre-install.sh
sh /usr/local/AppCentral/docker-ce/CONTROL/post-install.sh
sh /usr/local/AppCentral/docker-ce/CONTROL/pre-uninstall.sh
sh /usr/local/AppCentral/docker-ce/CONTROL/start-stop.sh
