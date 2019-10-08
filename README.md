# TCP/IP Laboratory manual

[![GitHub release](https://img.shields.io/github/release/UT-Network-Lab/TCP-IP-Laboratory.svg?style=flat-square)](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest)
[![Travis (.com) branch](https://img.shields.io/travis/com/UT-Network-Lab/TCP-IP-Laboratory/master.svg?style=flat-square)](https://travis-ci.com/UT-Network-Lab/TCP-IP-Laboratory)

## Chapters

* Linux & Simulator
  * Mininet
  * GNS3
* Introduction to Network Peripheral
* UDP
* TCP
* NAT
* VLan
* Routing (Static & Dynamic)
* AS Routing
* Security
* Firewall
* SDN and Routing Rules
* Multicast
* Socket Programming
* Network Performance

## ToDo

* [X] add farsi template
* [ ] add quiz sample
* [ ] add network equipment and device overview
* [ ] add pre-build projects requirement with IP and hosts map
* [x] rename hosts
* [x] replace image with schematic figure
* [X] update referencing in files
* [-] split and revise report
* [X] revise section titles and captions
* [?] revise links and references to section titles and captions
* [X] add reference to book (commands & ...)
* [ ] add api to transfer file to host
* [ ] update network tools
  * [ ] base linux
  * [ ] `socket` with `netcat`
  * [ ] linux routing service
  * [ ] router discovery
  * [ ] ...
  * [ ] gratuitous ARP in section 2.7
* [x] config CI/CD (generate _pdf_ to github release)
* [X] change `tcpdump` output for `tracerotue` (only see `ttl`)
* [ ] build custom figure with enabled multicast ping reply
* [ ] add route table for right subnet in exercise `8 Multicast Message`

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
