echo "clear;
docker start AdGuardHome
docker start qBittorrent
docker start Emby
docker start MariaDB
docker start ReverseProxy
docker start bitwarden" > docker_start.sh

echo "clear;
docker stop ReverseProxy
docker stop bitwarden
docker stop MariaDB
docker stop qBittorrent
docker stop Emby
docker stop AdGuardHome" > docker_stop.sh
