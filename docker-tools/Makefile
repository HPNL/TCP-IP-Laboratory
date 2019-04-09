CC=gcc
socket_url=http://www.icir.org/christian/downloads/sock-0.3.2.tar.gz
socket_dir=sock
docker_registery=hub.docker.com

.PHONY: default all clean docker-clean
default: all

clean: clean-docker
	rm -f netspy netspyd netspydd TCPclient TCPserver UDPclient UDPserver socket
	$(MAKE) -C $(socket_dir) clean

clean-docker:
	docker rmi ut/netlab/ipgui
	docker rmi ut/netlab/ipterm

all: netspy TCPclient TCPserver UDPclient UDPserver socket netlab-term netlab-gui

netspy:
	$(CC) netspydd.c -o netspydd
	$(CC) netspyd.c -o netspyd
	$(CC) netspy.c -o netspy
TCPclient:
	$(CC) TCPclient.c -o TCPclient
TCPserver:
	$(CC) TCPserver.c -o TCPserver
UDPclient:
	$(CC) UDPclient.c -o UDPclient
UDPserver:
	$(CC) UDPserver.c -o UDPserver

# http://www.icir.org/christian/sock.html
# https://github.com/anguslee/sock
socket:
	bash -c "test ! -f ${socket_dir}/Makefile && cd ./${socket_dir} && ./configure ||  cd .."
	$(MAKE) -C ${socket_dir}
	cp ${socket_dir}/src/sock socket

dockers: netlab-gui
gns3-ipterm:
	docker pull gns3/ipterm
gns3-webterm:
	docker pull gns3/webterm

netlab-term: netspy socket TCPserver UDPserver TCPclient UDPclient
	docker pull debian:jessie
	docker build -t ut/netlab/term -f term.Dockerfile .
netlab-gui: netlab-term
	docker build -t ut/netlab/gui -f gui.Dockerfile .
dockers-push:
	docker commit utnetlab/term
	docker commit utnetlab/gui
	docker push $(docker_registery)/ut/netlab/term
	docker push $(docker_registery)/ut/netlab/gui
