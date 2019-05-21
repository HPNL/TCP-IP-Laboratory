#!/bin/bash

# forked from https://raw.githubusercontent.com/GNS3/gns3-server/master/scripts/remote-install.sh

function log {
  echo "=> $1"  >&2
}

lsb_release -d | grep "LTS" > /dev/null
if [ $? != 0 ]
then
  echo "This script can only be run on a Linux Ubuntu LTS release"
  exit 1
fi

# Exit in case of error
set -e

export DEBIAN_FRONTEND="noninteractive"
UBUNTU_CODENAME=`lsb_release -c -s`

log "Add GNS3 repository"

# sudo add-apt-repository ppa:gns3/ppa
if [ "$UBUNTU_CODENAME" == "trusty" ]
then
        cat <<EOFLIST > /etc/apt/sources.list.d/gns3.list
deb http://ppa.launchpad.net/gns3/ppa/ubuntu $UBUNTU_CODENAME main
# deb http://ppa.launchpad.net/gns3/qemu/ubuntu $UBUNTU_CODENAME main 
EOFLIST
else
       cat <<EOFLIST > /etc/apt/sources.list.d/gns3.list
deb http://ppa.launchpad.net/gns3/ppa/ubuntu $UBUNTU_CODENAME main
# deb-src http://ppa.launchpad.net/gns3/ppa/ubuntu $UBUNTU_CODENAME main
EOFLIST
fi

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A2E3EF7B

log "Update system packages"
apt-get update

log "Upgrade packages"
apt-get upgrade --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

log " Install GNS3 packages"
apt-get install -y gns3-server

log "Create user GNS3 with /opt/gns3 as home directory"
if [ ! -d "/opt/gns3/" ]
then
  useradd -d /opt/gns3/ -m gns3
fi


log "Add GNS3 to the ubridge group"
usermod -aG ubridge gns3

# log "Install docker"
# if [ ! -f "/usr/bin/docker" ]
# then
#   curl -sSL https://get.docker.com | bash
# fi
apt-get install -y docker.io docker-compose docker

log "Add GNS3 to the docker group"
usermod -aG docker gns3


log "IOU setup"
dpkg --add-architecture i386
apt-get update

apt-get install -y gns3-iou

# Force the host name to gns3vm
echo gns3vm > /etc/hostname

# Force hostid for IOU
dd if=/dev/zero bs=4 count=1 of=/etc/hostid

# Block iou call. The server is down
echo "127.0.0.254 xml.cisco.com" | tee --append /etc/hosts

log "Add gns3 to the kvm group"
usermod -aG kvm gns3

log "Setup GNS3 server"

mkdir -p /etc/gns3
cat <<EOFC > /etc/gns3/gns3_server.conf
[Server]
host = 0.0.0.0
port = 3080 
images_path = /opt/gns3/images
projects_path = /opt/gns3/projects
appliances_path = /opt/gns3/appliances
configs_path = /opt/gns3/configs
report_errors = True
; Option to enable HTTP authentication.
auth = False
user = gns3
password = gns3

[Dynamips]
allocate_aux_console_ports = False
mmap_support = True
sparse_memory_support = True
ghost_ios_support = True

[IOU]
iourc_path = /opt/gns3/.iourc
;license_check = True

[Qemu]
enable_kvm = True
require_kvm = True
EOFC

chown -R gns3:gns3 /etc/gns3
chmod -R 700 /etc/gns3

if [ "$UBUNTU_CODENAME" == "trusty" ]
then
cat <<EOFI > /etc/init/gns3.conf
description "GNS3 server"
author      "GNS3 Team"

start on filesystem or runlevel [2345]
stop on runlevel [016]
respawn
console log


script
    exec start-stop-daemon --start --make-pidfile --pidfile /var/run/gns3.pid --chuid gns3 --exec "/usr/bin/gns3server"
end script

pre-start script
    echo "" > /var/log/upstart/gns3.log
    echo "[`date`] GNS3 Starting"
end script

pre-stop script
    echo "[`date`] GNS3 Stopping"
end script
EOFI

chown root:root /etc/init/gns3.conf
chmod 644 /etc/init/gns3.conf


log "Start GNS3 service"
set +e
service gns3 stop
set -e
service gns3 start

else
    # Install systemd service
    cat <<EOFI > /lib/systemd/system/gns3.service
[Unit]
Description=GNS3 server

[Service]
Type=forking
User=gns3
Group=gns3
PermissionsStartOnly=true
ExecStartPre=/bin/mkdir -p /var/log/gns3 /var/run/gns3
ExecStartPre=/bin/chown -R gns3:gns3 /var/log/gns3 /var/run/gns3
ExecStart=/usr/bin/gns3server --log /var/log/gns3/gns3.log \
     --pid /var/run/gns3/gns3.pid --daemon
Restart=on-abort
PIDFile=/var/run/gns3/gns3.pid

[Install]
WantedBy=multi-user.target
EOFI
    chmod 755 /lib/systemd/system/gns3.service
    chown root:root /lib/systemd/system/gns3.service

    log "Start GNS3 service"
    systemctl enable gns3
    systemctl start gns3
fi

log "GNS3 installed with success"


