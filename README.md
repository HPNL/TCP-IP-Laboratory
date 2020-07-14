# TCP/IP Laboratory manual

[![GitHub release](https://img.shields.io/github/release/UT-Network-Lab/TCP-IP-Laboratory.svg?style=flat-square)](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest)
![Docker Image CI](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/workflows/Docker%20Image%20CI/badge.svg)

## Introduction

This is the repository of Network Lab in University of Tehran. The lab based on **TCP/IP Essentials** book. All chapter updated to use with modern tools on `GNS3` simulator.

You can download all needed resource from [latest release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) and install all tools in [Installation](#Installation) section.

## Chapters

* Introduction to Network Peripheral

1. Linux and TCP-IP networking
2. Signel Segment Network
3. Bridges, LANs and the Cisco IOS
4. Static and dynamic routing
5. UDP and its applications
6. TCP study
7. Multicast and realtime service
8. The Web, DHCP, NTP and NAT
9. Network management and security

### Chapters ToDo

* VLan
* AS Routing (BGP, ...)
* Security
* Firewall
* SDN and Routing Rules
* Network Performance

## Installation

To setup environment, you need to install linux os like Ubuntu, Debian or other platform that support `GNS3` + `Docker`. To install `GNS3` you can follow [this](https://docs.gns3.com/1QXVIihk7dsOL7Xr7Bmz4zRzTsJ02wklfImGuHwTlaA4/index.html) link.

You can use native installed ubuntu (or other linux), **Virtual Machine** platform or use new Microsoft **WSL2** to install linux toolbox.

### Install tools

You can install all needed tools with bellow commands on Ubuntu x64 based linux:

```bash
# sudo add-apt-repository ppa:gns3/ppa
echo "deb http://ppa.launchpad.net/gns3/ppa/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gns3-ubuntu.list
sudo apt update
sudo apt install gns3-gui gns3-server wireshark
DockerType="Free"
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
sudo usermod -aG ubridge $USER
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
sudo usermod -aG wireshark $USER
sudo usermod -aG docker $USER
# loading new user group config
sudo reboot
```

### Get docker images

After install **docker**, you need to get **utnetlab** images and add into `GNS3`.

```bash
docker pull utnetlab/term
docker pull utnetlab/gui
```

Also you can [download](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) and load docker images from archive file as below:

```bash
# archive in (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz) format
docker load -i utnetlab_term.tar.xz
docker load -i utnetlab_gui.tar.xz
```

### Setup GNS3

To load template `Figures` you need to add **Cisco 3725** firmware and **utnetlab** docker images into `GNS3`.

#### Docker images

To add Docker images, you need to open `Preferences` menu (under `Edit` in *Linux/Windows* and `GNS3` in *Mac OS*). Under `Docker > Docker containers` you can add new images to `GNS3`. In the `New` dialog, you can select **existing image** (load local images) or **new image** (use docker pull) with image name. Set configuration as below for two docker.

GUI:

```js
{
  image: "utnetlab/gui",
  name: "ut-netlab-gui",
  adaptor: 1,
  startCommand: null, // or empty
  ConsoleType: "https",
  env: null // or empty
}
```

Terminal:

```js
{
  image: "utnetlab/term",
  name: "ut-netlab-term",
  adaptor: 1, // number of eth adaptor
  startCommand: null, // or empty
  ConsoleType: "telnet",
  env: null // or empty
}
```

Edit the `ut-netlab-gui` item and set **HTTP port in the container** from ~~80~~ into **443**.

#### Cisco images

To load Cisco images into `GNS3`, you need got into `Preferences > Dynamips > IOS routers` and add *new images*. Select file in *Browse* dialog and click on next. Set **c3725** for new router. Under *Memory* section, set *Default RAM* to **160 MB** at minimum. Skip *slots* step until get *Idle-PC* step. Click on *Idle-PC finder* to find local idle-PC number and then press *Finish*.

### Manual build tools and Docker images

To use available Figures, you need use customized Docker images.

```bash
sudo apt install build-essential automake autoconf autoreconf auto-tools bin-utils
cd ./docker-tools
make
cd ..
```

### Download Cisco firmware

For Cisco based lab, you need download `c3725-adventerprisek9-mz.124-25d.image` firmware and add to `GNS3`.

### Add docker images and Cisco firmware to GNS3

## Build documents (LaTeX)

You can build `LaTeX` files with below command or download all as `Documents.zip` from [release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) page.

```bash
latexmk -pdf -interaction=nonstopmode -cd **/*.tex
```

## Build Figures

You can build `Figures` files with below command or download all as `Figures.zip` from [release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) page.

```bash
cd Figures
./build-gns3p.sh
```

## Requirement

* Linux
* GNS3
* Mininet

## ToDo and Bugfix

* [ ] add farsi Chapter
* [ ] add figure and template for `Cisco IOS HTTP REST API` section
* [ ] add quiz sample
* [ ] add network equipment and device overview
* [ ] add api to transfer file to host
  * Can use `docker cp`
* [ ] update network tools
  * [ ] upgrade base docker image
  * [ ] base linux
  * [ ] `socket` with `netcat`
  * [ ] linux routing service
  * [ ] router discovery
  * [ ] ...
* [ ] build custom figure with enabled multicast ping reply
* [ ] add route table for right subnet in exercise `8 Multicast Message`

## Appendix

* [`ifconfig` vs `ip`](https://p5r.uk/blog/2010/ifconfig-ip-comparison.html)
* [`screen` Quick Reference](http://aperiodic.net/screen/quick_reference)
* [How To Use Linux `screen`](https://linuxize.com/post/how-to-use-linux-screen/)
* [_Quagga_](http://download.savannah.gnu.org/releases/quagga/)
* [_NIST Net_](https://www-x.antd.nist.gov/nistnet/): is no longer actively maintained. Much of its functionality has been incorporated into _NetEm_ and the `iproute2` toolkit. These are almost certainly already included in your Linux distribution
* [_DBS_](http://ns1.ai3.net/products/dbs): is no longer available. ([v1.1.5](http://www.kusa.ac.jp/~yukio-m/dbs/software1.1.5/dbs-1.1.5.tar.gz), [v1.2.0beta1](http://www.kusa.ac.jp/~yukio-m/dbs/software1.2.0beta1/dbs-1.2.0beta1.tar.gz), and [manual](http://www.kusa.ac.jp/~yukio-m/dbs/dbs_man.html))
  * [_Pbench_: a benchmarking and performance analysis framework](https://distributed-system-analysis.github.io/pbench/)
* [`ipbench`](http://ipbench.sourceforge.net)
* [`iputils`](https://github.com/iputils/iputils)
* new lab from [intronetworks](http://intronetworks.cs.luc.edu/)
