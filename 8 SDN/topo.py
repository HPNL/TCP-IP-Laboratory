from mininet.net import Mininet
from mininet.topo import Topo
from mininet.link import TCLink  # So we can rate limit links
from mininet.cli import CLI  # So we can bring up the Mininet CLI

net = Mininet(link=TCLink)
s1 = net.addSwitch("s1")  # Add switches and hosts to the topology
h1 = net.addHost("h1", ip='10.0.0.1/24', mac='00:00:00:00:00:01')
h2 = net.addHost("h2", ip='10.0.0.2/24', mac='00:00:00:00:00:02')
h3 = net.addHost("h3", ip='30.0.0.3/24', mac='00:00:00:00:00:03')
#net.addController("c0")

# Wire the switches and hosts together. Note there is a loop!
net.addLink("h1", "s1", delay='10ms')
net.addLink("h2", "s1", delay='10ms')
net.addLink("h3", "s1", delay='10ms')

net.start()
h1.cmd("arp -s 10.0.0.254 00:00:00:00:11:11")
h1.cmd("route add default gw 10.0.0.254 h1-eth0")

h2.cmd("arp -s 10.0.0.254 00:00:00:00:11:11")
h2.cmd("route add default gw 10.0.0.254 h2-eth0")

h3.cmd("route add default gw 30.0.0.254 h3-eth0")
h3.cmd("arp -s 30.0.0.254 00:00:00:00:33:33")
h3.cmd("sudo python -m SimpleHTTPServer 80 &")

CLI(net)  # Bring up the mininet CLI
net.stop()
