# Installation

This installation based on [GNS3 Installation](https://docs.gns3.com/docs/getting-started/installation/linux/) for linux.

If you use `GNS3 VM` or need to connect a remote server, use [install remote](./INSTALL-remote.md) document for setup remote server.

## Requirement

* Linux (Ubuntu 20.04, Debian 10 or other supported linux)
* GNS3
* Docker
* Cisco router image
<!-- * Mininet -->

## Install tools

We prefer to use pre-build **VM** from `GNS3` github.
Also, you can use last long term support (LTS) branch of **Ubuntu** or **Debian** linux to setup `GNS3`.

### Client & Server (pre-build VM)

You can setup your desktop connect to remote server.
Pre-build **VM**s can downloaded from [this](https://github.com/GNS3/gns3-gui/releases) url.
Download local executable (`.exe` or `.dmg`) and the **VM** image according to your hypervisor and import it.

#### Setup remote server

After download and boot your **remote-server**, you need setup your local `GNS3` as client of the **remote-server** (maybe you need change the **VM** network config into *bridge*).
For do this, got into `Preferences > Server > Main server` and then disable local server.
In the new panel, set remote **Host=***`displayed-ip`*, **Port=*80*** and disable **Auth**.

After setup the **remote-server** on your client, you need download docker images in server `shell` ([Get docker images](#Get-docker-images)).
All the other setup, can do in client `GUI` like local `GNS3` ([Setup GNS3](#Setup-GNS3)).

### Ubuntu (18.04, 20.04, 20.10, 21.04)

You can install all needed tools with bellow commands on Ubuntu x64 based linux:

```bash
# echo "deb http://ppa.launchpad.net/gns3/ppa/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gns3-ubuntu.list
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt install gns3-gui gns3-server wireshark

## To install preview of gns3 webclient, uncomment this line
# sudo apt install gns3-webclient-pack
```

```bash
## to install open source edition of docker use "Free"
## else use "CE" to install community edition of docker
DockerType="Free" # "CE"
if [ $DockerType == "Free" ]; then
  sudo apt install docker.io
else
  sudo apt remove docker docker-engine docker.io
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install docker-ce
fi
```

verify installation:

 ```bash
 sudo docker run hello-world
 ```

 adding your user to the “docker” group:

 ```bash
for i in ubridge libvirt kvm docker wireshark; do
  sudo usermod -aG $i $USER
done
# loading new user group config
sudo su $USER
```

### Debian 10

```bash
sudo apt update
sudo apt install -y python3-pip python3-pyqt5 python3-pyqt5.qtsvg \
python3-pyqt5.qtwebsockets \
qemu qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst \
wireshark xtightvncviewer apt-transport-https \
ca-certificates curl gnupg2 software-properties-common

sudo pip3 install gns3-server
sudo pip3 install gns3-gui
# if install with user pip3, it will be installed into "$HOME/.local/bin"
# add 'export PATH="$HOME/.local/bin:$PATH"' into end of .bashrc

echo "deb http://ppa.launchpad.net/gns3/ppa/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/gns3.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F88F6D313016330404F710FC9A2FD067A2E3EF7B

sudo apt-get update
sudo apt install dynamips ubridge
```

```bash
## to install open source edition of docker use "Free"
## else use "CE" to install community edition of docker
DockerType="Free" # "CE"
if [ $DockerType == "Free" ]; then
  sudo apt install docker.io
else
  sudo apt remove docker docker-engine docker.io
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install docker-ce
fi
```

verify installation:

 ```bash
 sudo docker run hello-world
 ```

 adding your user to the “docker” group:

 ```bash
for i in ubridge libvirt kvm docker wireshark sudo; do
  sudo usermod -aG $i $USER
done
# loading new user group config
sudo su $USER
```

### Ubuntu Distribution Upgrade

If you upgrade your ubuntu distribution, you need to remove old `GNS3` repository and add again.

```bash
sudo rm /etc/apt/sources.list.d/gns3*
sudo add-apt-repository ppa:gns3/ppa
sudo apt-get update
sudo apt-get -y -u dist-upgrade
```

### Commented

 Reference [1] : <https://docs.docker.com/install/linux/docker-ce/ubuntu/#supported-storage-drivers>

## Get docker images

After install **docker**, you need to get **utnetlab** images and add into `GNS3`.

```bash
docker pull utnetlab/term
docker pull utnetlab/gui
```

Also you can pull this images from github package section. But you need to add docker tag.

```bash
# may be need login to github:
# https://docs.github.com/en/packages/guides/configuring-docker-for-use-with-github-packages
docker pull docker.pkg.github.com/ut-network-lab/docker-tools/term:latest
docker tag docker.pkg.github.com/ut-network-lab/docker-tools/term:latest utnetlab/term:latest
docker pull docker.pkg.github.com/ut-network-lab/docker-tools/gui:latest
docker tag docker.pkg.github.com/ut-network-lab/docker-tools/gui:latest utnetlab/gui:latest
```

### Get from proxy

If you need to use proxy, you can use one of the following way.
You can replace the `dockerhub.ir` with any proxy host.

#### Set in docker deamon file

```bash
echo '{
  "registry-mirrors": ["https://dockerhub.ir"]
}' | sudo tee /etc/docker/daemon.json
sudo systemctl restart docker
```

#### Pull from proxy

```bash
docker pull dockerhub.ir/utnetlab/term:latest
docker tag dockerhub.ir/utnetlab/term:latest utnetlab/term:latest
docker pull dockerhub.ir/utnetlab/gui:latest
docker tag dockerhub.ir/utnetlab/gui:latest utnetlab/gui:latest
```

<!-- Also you can [download](https://github.com/orgs/UT-Network-Lab/packages?repo_name=docker-tools) and load docker images from archive file as below: -->

<!-- ```bash
# archive in (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz) format
docker load -i utnetlab_term.tar.xz
docker load -i utnetlab_gui.tar.xz
``` -->

## Setup GNS3

To load template `Figures` you need to add **Cisco 3725** firmware and **utnetlab** docker images into `GNS3`.
In this section we configure and setup base hosts and router images.

### Docker images

To add Docker images, you need to open `Preferences` menu (under `Edit` in *Linux/Windows* and `GNS3` in *Mac OS*).

![gns3-select-preferences](./img/gns3-select-preferences.jpg)

Under `Docker > Docker containers` you can add new images to `GNS3`.

![gns3-add-docker](./img/gns3-docker-add.jpg)

In the `New` dialog, you can select **existing image** (load local images) or **new image** (use docker pull) with image name.

![gns3-docker-select-image](./img/gns3-docker-select-image.jpg)

Set image name like `utnetlab-gui`.

![gns3-docker-set-name](./img/gns3-docker-set-name.jpg)

Set adaptor count to `1`.

![gns3-docker-select-adaptor-count](./img/gns3-docker-select-adaptor-count.jpg)

Not need to set start command. But can set for custom start command (like add to start service at docker startup).

![gns3-docker-start-command](./img/gns3-docker-start-command.jpg)

Set console type for your image.

* `telnet` for command line environments
* `vnc` for GUI image output (has a but and random disconnect (need to restart host))
* `http` & `https` for web based service

We made new docker image `utnetlab/gui` to bypass `vnc` bug and see `vnc` output on `http` or `https` port. In this case, after select `https` type, you need edit http port and set to **443**.

![gns3-docker-console-type](./img/gns3-docker-console-type.jpg)

If need custom environments variable for your image, set variables in this page, else left it empty.

![gns3-docker-env](./img/gns3-docker-env.jpg)

Edit the `utnetlab-gui` item and set **HTTP port in the container** from ~~80~~ into **443**.

![gns3-docker-edit](./img/gns3-docker-edit.jpg)
![gns3-docker-set-http-port](./img/gns3-docker-set-http-port.jpg)

Set configuration as below for two docker (use value according to key at each setup dialog).

GUI:

```js
{
  image: "utnetlab/gui",
  name: "utnetlab-gui",
  adaptor: 1,
  startCommand: null, // or empty
  ConsoleType: "https",
  env: null // or empty
}
```

For terminal image (`utnetlab/term`) select `telnet` for **ConsoleType** and not need to change http port value.

Terminal:

```js
{
  image: "utnetlab/term",
  name: "utnetlab-term",
  adaptor: 1, // number of eth adaptor
  startCommand: null, // or empty
  ConsoleType: "telnet",
  env: null // or empty
}
```


### Cisco images

To load [Cisco images](http://tfr.org/cisco-ios/37xx/3725/c3725-adventerprisek9-mz.124-25d.bin) into `GNS3`, you need got into `Preferences > Dynamips > IOS routers` and add *new images*.

![gns3-router-add](./img/gns3-router-add.jpg)

Select file in *Browse* dialog and click on next.

![gns3-router-load-image](./img/gns3-router-load-image.jpg)

Set name to **c3725** for new router.

![gns3-router-name](./img/gns3-router-name.jpg)

Under *Memory* section, set *Default RAM* to **160 MB** at minimum.

![gns3-router-ram](./img/gns3-router-ram.jpg)

Skip *slots* step until get *Idle-PC* step.

![gns3-router-slots](./img/gns3-router-slots.jpg)
![gns3-router-wic](./img/gns3-router-wic.jpg)

Click on **Idle-PC finder** to find local idle-PC number if it was empty and then press **Finish**.
(Default value for idle-PC is **0x602467a4**)

![gns3-router-idlepc](./img/gns3-router-idlepc.jpg)

