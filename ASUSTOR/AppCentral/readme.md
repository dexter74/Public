#### Package
```
apt install -y cifs-utils,
```

#### Monter les partages
```
PARTAGE_IP=192.168.1.32
PARTAGE_USER=
PARTAGE_PASS=
PARTAGE_ID=1000
PARTAGE_GID=1000
```

```
mkdir -p /mnt/Download;
mkdir /etc/credentials;
```

```
echo "username=$PARTAGE_USER
password=$PARTAGE_PASS
vers=3.0
file_mode=0777
dir_mode=0777
workgroup=WORKGROUP" > /etc/credentials/.smbpassword;
chmod 600 /etc/credentials/.smbpassword;
```

```
echo "[Unit]
Description=Montage du partage Download
Requires=network-online.target
After=NetworkManager.service

[Mount]
What=//$PARTAGE_IP/Download
Where=/mnt/Download
Type=cifs
TimeoutSec=5s
Options=credentials=/etc/credentials/.smbpassword,x-gvfs-show,uid=$PARTAGE_ID,gid=$PARTAGE_GID

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/mnt-Download.mount;
```

```
```
```
systemctl daemon-reload;
systemctl stop    mnt-Download.mount;

systemctl restart mnt-Download.mount;
systemctl start   mnt-Download.mount;

systemctl disable mnt-Download.mount;
systemctl enable  mnt-Download.mount;
```
