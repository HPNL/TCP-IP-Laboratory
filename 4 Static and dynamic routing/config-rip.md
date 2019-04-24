# Hosts

## h1

``` bash
ifconfig eth0 128.238.61.101/24
route add -net 128.238.0.0/16 dev eth0
tcpdump -vnex -s 100 -c 8 udp port 520
```

## h2

```bash
ifconfig eth0 128.238.62.101/24
route add -net 128.238.0.0/16 dev eth0
# route add default gw 128.238.62.2
tcpdump -vnex -s 100 -c 8 udp port 520
```

## h3

```bash
ifconfig eth0 128.238.63.101/24
route add -net 128.238.0.0/16 dev eth0
# route add default gw 128.238.63.3
tcpdump -vnex -s 100 -c 8 udp port 520
```

## h4

```bash
ifconfig eth0 128.238.64.101/24
route add -net 128.238.0.0/16 dev eth0
# route add default gw 128.238.64.4
tcpdump -vnex -s 100 -c 8 udp port 520
```

# Router

## R1

```bash
config term
    router rip
        network 128.238.0.0
    int f0/0
        ip addr 128.238.61.1 255.255.255.0
        no shut
    int f0/1
        ip addr 128.238.62.1 255.255.255.0
        no shut
    end
```

## R2

```shell
config term
router rip
network 128.238.0.0
int f0/0
ip addr 128.238.62.2 255.255.255.0
no shut
int f0/1
ip addr 128.238.63.2 255.255.255.0
no shut
end
```

## R3

```
config term
router rip
network 128.238.0.0
int f0/0
ip addr 128.238.63.3 255.255.255.0
no shut
int f0/1
ip addr 128.238.64.3 255.255.255.0
no shut
end
```

## R4
```
config term
router rip
network 128.238.0.0
int f0/0
ip addr 128.238.64.4 255.255.255.0
no shut
int f0/1
ip addr 128.238.61.4 255.255.255.0
no shut
end
```
