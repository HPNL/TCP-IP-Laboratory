# Figure 2.9

```Cisco
config term
    interface f0/0
        ip addr 128.238.64.4 255.255.255.0
        no shut
        ip proxy-arp
    interface f0/1
        ip addr 128.238.65.4 255.255.255.0
        no shut
        ip proxy-arp
        exit
    exit
```
