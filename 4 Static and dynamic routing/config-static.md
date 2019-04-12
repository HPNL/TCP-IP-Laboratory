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
ip route 128.238.64.0 255.255.255.0 128.238.63.3
ip route 128.238.65.0 255.255.255.0 128.238.63.3
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
ip route 128.238.62.0 255.255.255.0 128.238.63.2
ip route 128.238.65.0 255.255.255.0 128.238.64.4
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
ip route 128.238.62.0 255.255.255.0 128.238.64.3
ip route 128.238.63.0 255.255.255.0 128.238.64.3
end
```
