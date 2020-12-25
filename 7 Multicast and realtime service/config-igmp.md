# Hosts

## H1

```bash
# 7
ifconfig eth0 128.238.63.101/24
# 8
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.64.0/24 dev eth0
netspy 224.111.111.111 1500 &
netspyd 224.111.111.111 1500 16

ping 128.238.63.102
ping 128.238.64.103
```

## H2

```bash
# 7
ifconfig eth0 128.238.63.102/24
# 8
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.64.0/24 dev eth0
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
netspy 224.111.111.111 1500 &
telnet netlab@128.238.63.101
# 9
tcpdump ip multicast
pkill netspy
```

## H3

```bash
# 7
ifconfig eth0 128.238.64.103/24
# 8
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.63.0/24 dev eth0
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
netspy 224.111.111.111 1500 &
# 9
tcpdump ip multicast
```

## H4

```bash
# 7
ifconfig eth0 128.238.64.104/24
# 8
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.63.0/24 dev eth0
netspy 224.111.111.111 1500 &
pkill netspy
```

# Router

## R1

```bash
# 7
config term
    ip multicast-routing
    int f0/0
        ip addr 128.238.63.3 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    int f0/1
        ip addr 128.238.64.3 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    end
show ip igmp interface
show ip igmp group
# 8
show ip igmp interface
show ip igmp group
# 9
config term
    int f0/0
        ip igmp join-group 224.0.0.2
```