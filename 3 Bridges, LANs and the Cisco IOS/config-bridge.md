# Topo 3.7

## R4

```Cisco
config term
    no ip routing
    bridge 1 protocol ieee ! for STP protocol
    int f0/0
        ip addr 128.238.61.1 255.255.255.0
        bridge-group 1
        no shut
        exit
    int f0/1
        ip addr 128.238.61.2 255.255.255.0
        bridge-group 1
        no shut
        end
```

# Topo 3.8

## R1

```cisco
config term
    no ip routing
    bridge 1 protocol ieee ! for STP protocol
    int f0/0
        ip addr 128.238.61.1 255.255.255.0
        bridge-group 1
        no shut
        exit
    int f0/1
        ip addr 128.238.61.10 255.255.255.0
        bridge-group 1
        no shut
        end
```

## R2

```cisco
config term
    no ip routing
    bridge 1 protocol ieee ! for STP protocol
    int f0/0
        ip addr 128.238.61.2 255.255.255.0
        bridge-group 1
        no shut
        exit
    int f0/1
        ip addr 128.238.61.20 255.255.255.0
        bridge-group 1
        no shut
        end
```

## R3

```cisco
config term
    no ip routing
    bridge 1 protocol ieee ! for STP protocol
    int f0/0
        ip addr 128.238.61.3 255.255.255.0
        bridge-group 1
        no shut
        exit
    int f0/1
        ip addr 128.238.61.30 255.255.255.0
        bridge-group 1
        no shut
        end
```

## R4

```cisco
config term
    no ip routing
    bridge 1 protocol ieee ! for STP protocol
    int f0/0
        ip addr 128.238.61.4 255.255.255.0
        bridge-group 1
        no shut
        exit
    int f0/1
        ip addr 128.238.61.40 255.255.255.0
        bridge-group 1
        no shut
        end
```
