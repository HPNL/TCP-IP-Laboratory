# Hosts

## h0

```bash
# 11
ifconfig eth0 128.238.61.100/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
    tcpdump ip multicast &
netspy 224.111.111.111 1500 &
# 8

```

## h1

```bash
# 11
ifconfig eth0 128.238.61.101/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
tcpdump ip multicast &
# 8

```

## h2

```bash
# 11
ifconfig eth0 128.238.62.100/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
    tcpdump ip multicast &
netspy 224.111.111.111 1500 &
# 8

```

## h3

```bash
# 11
ifconfig eth0 128.238.63.100/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    tcpdump ip multicast &
netspy 224.111.111.111 1500 &
# 8

```

## h4

```bash
# 11
ifconfig eth0 128.238.63.101/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
    tcpdump ip multicast &
netspyd 224.111.111.111 1500 16
# 8

```

## h5

```bash
# 11
ifconfig eth0 128.238.64.100/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
    tcpdump ip multicast &
netspy 224.111.111.111 1500 &
# 8

```

## h6

```bash
# 11
ifconfig eth0 128.238.65.100/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
    tcpdump ip multicast &
netspy 224.111.111.111 1500 &
# 8

```

## h7

```bash
# 11
ifconfig eth0 128.238.65.101/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
route add -net 128.238.0.0/16 dev eth0
tcpdump ip multicast &
# 8

```

# Router

## R1

```bash
# 11
config term
    ip multicast-routing
    int f0/0
        ip addr 128.238.61.1 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    int f0/1
        ip addr 128.238.62.1 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    end
# 12
mstat
```

## R2

```bash
# 11
config term
    ip multicast-routing
    int f0/0
        ip addr 128.238.62.2 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    int f0/1
        ip addr 128.238.63.2 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    end
# 12
mstat
```

## R3

```bash
# 11
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
# 12
mstat
```

## R4

```bash
# 11
config term
    ip multicast-routing
    int f0/0
        ip addr 128.238.63.4 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    int f0/1
        ip addr 128.238.65.4 255.255.255.0
        ip pim dense-mode
        no shut
        exit
    end
# 12
mstat
```