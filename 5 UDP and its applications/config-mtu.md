# Hosts

## h1

``` bash
ifconfig eth0 128.238.61.101/24
route add -net 128.238.0.0/16 dev eth0
```

## h2

```bash
ifconfig eth0 128.238.62.101/24
route add -net 128.238.0.0/16 dev eth0
```

# Router

## R1

```bash
config term
    int f0/0
        ip addr 128.238.61.1 255.255.255.0
        no shut
        exit
    int f0/1
        ip addr 128.238.62.1 255.255.255.0
        ip mtu 500
        no shut
        exit
    end
```
