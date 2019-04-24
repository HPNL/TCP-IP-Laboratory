# Hosts

## h2

```bash
ifconfig eth0 128.238.62.101/24
# route add -net 128.238.0.0/16 dev eth0
route add default gw 128.238.62.2
tcpdump -x -s 120 ip proto 89
```

## h3

```bash
ifconfig eth0 128.238.63.101/24
# route add -net 128.238.0.0/16 dev eth0
route add default gw 128.238.63.3
tcpdump -x -s 120 ip proto 89
```

## h4

```bash
ifconfig eth0 128.238.64.101/24
# route add -net 128.238.0.0/16 dev eth0
route add default gw 128.238.64.4
tcpdump -x -s 120 ip proto 89
```

## h5

``` bash
ifconfig eth0 128.238.65.101/24
# route add -net 128.238.0.0/16 dev eth0
route add default gw 128.238.65.4
tcpdump -x -s 120 ip proto 89
```

# Router

## R2

```shell
config term
    int f0/0
        ip addr 128.238.62.2 255.255.255.0
        no shut
    int f0/1
        ip addr 128.238.63.2 255.255.255.0
        no shut
        exit
    router ospf 2
        network 128.238.0.0 0.0.255.255 area 1
    end
```

## R3

```shell
config term
int f0/0
ip addr 128.238.63.3 255.255.255.0
no shut
int f0/1
ip addr 128.238.64.3 255.255.255.0
no shut
exit
router ospf 3
network 128.238.0.0 0.0.255.255 area 1
end
```

## R4
```shell
config term
int f0/0
ip addr 128.238.64.4 255.255.255.0
no shut
int f0/1
ip addr 128.238.65.4 255.255.255.0
no shut
exit
router ospf 4
network 128.238.0.0 0.0.255.255 area 1
end
```
