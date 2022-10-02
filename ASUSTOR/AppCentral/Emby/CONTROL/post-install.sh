docker stop Emby


docker run -d --net=bridge \
  --name Emby \
  --restart unless-stopped \
  -v '/share/Docker/Emby:/config' \
  -v '/share/Video/:/Video' \
  --device=/dev/dri:/dev/dri \
  -p 8096:8096 \
  -e UID=1000 \
  -e GID=999 \
  -e GIDLIST=100 \
  --label cacher="oui" \
emby/embyserver
