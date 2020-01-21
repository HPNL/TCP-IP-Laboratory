# TCP/IP Laboratory manual

[![GitHub release](https://img.shields.io/github/release/UT-Network-Lab/TCP-IP-Laboratory.svg?style=flat-square)](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest)
[![Travis (.com) branch](https://img.shields.io/travis/com/UT-Network-Lab/TCP-IP-Laboratory/master.svg?style=flat-square)](https://travis-ci.com/UT-Network-Lab/TCP-IP-Laboratory)

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
* [ ] update network tools
  * [ ] upgrade base docker image
  * [ ] base linux
  * [ ] `socket` with `netcat`
  * [ ] linux routing service
  * [ ] router discovery
  * [ ] ...
* [ ] build custom figure with enabled multicast ping reply
* [ ] add route table for right subnet in exercise `8 Multicast Message`

* add docker with use novnc gui
    * https://www.github.com/theasp/docker-novnc
    * https://www.github.com/x11vnc/x11vnc-desktop
    * https://github.com/gotget/docker-novnc
    * https://www.github.com/centminmod/docker-ubuntu-vnc-desktop
    * https://github.com/fcwu/docker-ubuntu-vnc-desktop
    * https://github.com/ConSol/docker-headless-vnc-container



# Appendix

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
