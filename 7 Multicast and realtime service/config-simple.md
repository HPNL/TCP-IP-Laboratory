# Hosts

# H1

```bash
# 1
ifconfig eth0 128.238.66.101/24
netstat -rn
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
netstat -rn
# 2
netstat -g
# 3
ping 224.0.0.1
## 3.1
ping -b 128.238.66.255
# 4
socket -i -u -n1 128.238.66.102 echo
## 4.1
socket -i -u -n1 230.11.111.10 2000
# 5
netspy 224.111.111.111 1500 &
```

# H2

```bash
# 1
ifconfig eth0 128.238.66.102/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# 5
netspy 224.111.111.111 1500 &
```

# H3

```bash
# 1
ifconfig eth0 128.238.66.103/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# 5
netspy 224.111.111.111 1500 &
```

# H4

```bash
# 1
ifconfig eth0 128.238.66.104/24
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
# 5
netspy 224.111.111.111 1500 &
# 6
ping 224.111.111.111
```