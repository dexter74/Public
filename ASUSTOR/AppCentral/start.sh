########################################################################################
# https://github.com/dexter74/Archives/tree/main/Docker/V1/2.Conteneurs

########################################################################################
# Edit container before deploy
#nano ~/APPZ/ASUSTOR/AppCentral/NordVPN/CONTROL/post-install.sh;

echo "##########################################";
echo "# Container Ready for Deploy             #";
echo "#  > AdGuardHome                         #";
cd ~/APPZ/ASUSTOR/AppCentral/AdGuardHome        && apkg-tools_py3.py create .
echo "#  > BitWarden                           #";
cd ~/APPZ/ASUSTOR/AppCentral/Bitwarden          && apkg-tools_py3.py create .
echo "#  > Dozzle                              #";
cd ~/APPZ/ASUSTOR/AppCentral/Dozzle             && apkg-tools_py3.py create .
echo "#  > Emby                                #";
cd ~/APPZ/ASUSTOR/AppCentral/Emby               && apkg-tools_py3.py create .
echo "#  > Flaresolverr                        #";
cd ~/APPZ/ASUSTOR/AppCentral/Flaresolverr       && apkg-tools_py3.py create .
echo "#  > Jackett                             #";
cd ~/APPZ/ASUSTOR/AppCentral/Jackett            && apkg-tools_py3.py create .
echo "#  > JDownloader                         #";
cd ~/APPZ/ASUSTOR/AppCentral/Jdownloader       && apkg-tools_py3.py create .
echo "#  > Jellyfin                            #";
cd ~/APPZ/ASUSTOR/AppCentral/Jellyfin           && apkg-tools_py3.py create .
echo "#  > Librespeed                          #";
cd ~/APPZ/ASUSTOR/AppCentral/LibreSpeed         && apkg-tools_py3.py create .
echo "#  > MariaDB                             #";
cd ~/APPZ/ASUSTOR/AppCentral/MariaDB            && apkg-tools_py3.py create .
echo "#  > Nginx Reverse Proxy                 #";
cd ~/APPZ/ASUSTOR/AppCentral/NginxReverseProxy  && apkg-tools_py3.py create .
echo "#  > Portainer                           #";
cd ~/APPZ/ASUSTOR/AppCentral/Portainer          && apkg-tools_py3.py create .
echo "#  > QBittorrent                         #";
cd ~/APPZ/ASUSTOR/AppCentral/QBittorrent        && apkg-tools_py3.py create .
echo "#  > Radarr                              #";
cd ~/APPZ/ASUSTOR/AppCentral/Radarr             && apkg-tools_py3.py create .
echo "#  > Sonarr                              #";          
cd ~/APPZ/ASUSTOR/AppCentral/Sonarr             && apkg-tools_py3.py create .



echo "##########################################";
echo "# Container in Testing                   #";

echo "#  > Adminer                             #";
cd ~/APPZ/ASUSTOR/AppCentral/Adminer/           && apkg-tools_py3.py create .

echo "#  > Amule                               #";
cd ~/APPZ/ASUSTOR/AppCentral/Amule/              && apkg-tools_py3.py create .

echo "#  > Collabora                           #";
cd ~/APPZ/ASUSTOR/AppCentral/Collabora           && apkg-tools_py3.py create .

echo "#  > MKcert                              #";
cd ~/APPZ/ASUSTOR/AppCentral/mkcert              && apkg-tools_py3.py create .

echo "#  > NextCloud                           #";
cd ~/APPZ/ASUSTOR/AppCentral/Nextcloud           && apkg-tools_py3.py create .

echo "#  > Only Office DocumentServer          #";
cd ~/APPZ/ASUSTOR/AppCentral/OnlyOffice          && apkg-tools_py3.py create .

echo "#  > Microsoft KMS Server Activator      #";
cd ~/APPZ/ASUSTOR/AppCentral/KMS               && apkg-tools_py3.py create .
echo "##########################################";

#echo "##########################################";
echo "# Container was required fix reboot NAS  #";
cd ~/APPZ/ASUSTOR/AppCentral/Wireguard          && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/NordVPN            && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Base              && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Exemple           && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Cloud9             && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/FileBrowser        && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Nexclipper         && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Plex               && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Portainer          && apkg-tools_py3.py create .
#cd ~/APPZ/ASUSTOR/AppCentral/Visual_Studio      && apkg-tools_py3.py create .



########################################################################################
# Container Edit and Ready for Deploy
# --------------------------------------------------------------------------------------
# nano ~/APPZ/ASUSTOR/AppCentral/NOIP/CONTROL/post-install.sh;
# cd ~/APPZ/ASUSTOR/AppCentral/NOIP             && apkg-tools_py3.py create .
# --------------------------------------------------------------------------------------
########################################################################################
# En Developpement
# cd ~/APPZ/ASUSTOR/AppCentral/phpMyAdmin       && apkg-tools_py3.py create .
# cd ~/APPZ/ASUSTOR/AppCentral/Pyload/          && apkg-tools_py3.py create .
# cd ~/APPZ/ASUSTOR/AppCentral/Jackett          && apkg-tools_py3.py create .
# cd ~/APPZ/ASUSTOR/AppCentral/Radarr           && apkg-tools_py3.py create .
# cd ~/APPZ/ASUSTOR/AppCentral/Sonarr           && apkg-tools_py3.py create .
########################################################################################
