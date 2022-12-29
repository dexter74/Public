echo "clear;
docker start AdGuardHome
docker start qBittorrent
docker start Emby
docker start MariaDB
docker start ReverseProxy
docker start bitwarden
docker start PyLoad" > docker_start.sh

echo "clear;
docker stop bitwarden
docker stop ReverseProxy
docker stop MariaDB
docker stop PyLoad
docker stop qBittorrent
docker stop Emby
docker stop AdGuardHome" > docker_stop.sh
