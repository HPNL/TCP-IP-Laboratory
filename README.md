# TCP/IP Laboratory manual

[![GitHub release](https://img.shields.io/github/release/UT-Network-Lab/TCP-IP-Laboratory.svg?style=flat-square)](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest)
![Docker Image CI](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/workflows/Docker%20Image%20CI/badge.svg)

## Introduction

This is the repository of Network Lab in University of Tehran. The lab based on **TCP/IP Essentials** book. All chapter updated to use with modern tools on `GNS3` simulator.

You can download all needed resource from [latest release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) and install all tools in [Installation](#Installation) section.

## Chapters

* Introduction to Network Peripheral

1. Linux and TCP-IP networking
2. Single Segment Network
3. Bridges, LANs and the Cisco IOS
4. Static and dynamic routing
5. UDP and its applications
6. TCP study
7. Multicast and realtime service
8. The Web, DHCP, NTP and NAT
9. Network management and security
10. *preview*: SDN

## Installation

### Requirements

1. install linux(e.g. Ubuntu 18.04 or Debian or any platform that supports `GNS3` + `Docker`) or a linux VM You can use native installed ubuntu (or other linux), Virtual Machine platform or use new Microsoft WSL2 to install linux toolbox.
2. `GNS3` + `Docker` installation: [click here](./INSTALL.md)

## Build Resource

To build the all resource (LaTeX, Docker tools, Figures) follow [BUILD.md](./BUILD.md) instructions.

## License

Open GPLv3 [LICENSE](LICENSE) file.

### Chapters ToDo

* IPv6
* VLan
* AS Routing (BGP, EBGP, ...)
* Security
* Firewall
* SDN and Routing Rules
* Network Performance
* Load balancing
* MPLS
* Segment Routing
* SDN
* VPN
* SRV6

## ToDo and Bugfix

* [ ] add farsi Chapter
* [ ] add network equipment and device overview
* [ ] add api to transfer file to host
  * Can use `docker cp`
* [ ] add routing service from [FRR](https://frrouting.org/) (based on [quagga](https://www.quagga.net/)) or [BIRD](https://bird.network.cz/)
* [ ] cahnge your/remote/other host in text with *h_x*
* [ ] Network Traffic generation lab
  ([trex-core](https://github.com/cisco-system-traffic-generator/trex-core),
  [trex-emu](https://github.com/cisco-system-traffic-generator/trex-emu),
  [warp17](https://github.com/Juniper/warp17),
  [ostinato](https://github.com/pstavirs/ostinato),
  [nping](https://nmap.org/nping/),
  [iperf](https://iperf.fr/),
  [httperf](https://github.com/httperf/httperf)
  [netperf](https://github.com/HewlettPackard/netperf))
* [ ] update network tools
  * [ ] base linux
  * [ ] `socket` with `netcat`
  * [ ] linux routing service
  * [ ] ...

## Useful tools

* [`ifconfig` vs `ip`](https://p5r.uk/blog/2010/ifconfig-ip-comparison.html)
* Terminal multiplexer: (to run multiple terminal session in one screen)
  * `screen`: [How To Use Linux Screen](https://linuxize.com/post/how-to-use-linux-screen/)
  * `tmux`: [Getting started with Tmux](https://linuxize.com/post/getting-started-with-tmux/)
  * compare: [linuxhint](https://linuxhint.com/tmux_vs_screen/), [superuser](https://superuser.com/questions/236158/tmux-vs-screen)
* [_NIST Net_](https://www-x.antd.nist.gov/nistnet/): is no longer actively maintained. Much of its functionality has been incorporated into _NetEm_ and the `iproute2` toolkit. These are almost certainly already included in your Linux distribution
* [_DBS_](http://ns1.ai3.net/products/dbs): is no longer available. ([v1.1.5](http://www.kusa.ac.jp/~yukio-m/dbs/software1.1.5/dbs-1.1.5.tar.gz), [v1.2.0beta1](http://www.kusa.ac.jp/~yukio-m/dbs/software1.2.0beta1/dbs-1.2.0beta1.tar.gz), and [manual](http://www.kusa.ac.jp/~yukio-m/dbs/dbs_man.html))
  * [_Pbench_: a benchmarking and performance analysis framework](https://distributed-system-analysis.github.io/pbench/)
* [`ipbench`](http://ipbench.sourceforge.net)
* [`iputils`](https://github.com/iputils/iputils)
* [mininet](http://mininet.org/) and [mininet-wifi](https://mininet-wifi.github.io/)
* [containernet](https://containernet.github.io/)

## Other lab

* new lab from [intronetworks](http://intronetworks.cs.luc.edu/)
* new lab [bsdrp](https://bsdrp.net/)
* new lab [smallko](http://csie.nqu.edu.tw/smallko/sdn/sdn.htm)
* new lab [networklessons](https://networklessons.com)
* new lab [TDTS06 Computer Networks](https://www.ida.liu.se/~TDTS06/labs/)
