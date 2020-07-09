CC=gcc
socket_url=http://www.icir.org/christian/downloads/sock-0.3.2.tar.gz
socket_dir=sock
docker_registery=hub.docker.com
docker_tag=9904

.PHONY: default all clean docker-clean
default: all

clean: clean-docker clean-tool clean-socket

clean-tool:
	rm -f netspy netspyd netspydd TCPclient TCPserver UDPclient UDPserver socket
clean-socket:
	$(MAKE) -C $(socket_dir) clean
	$(MAKE) -C $(socket_dir) distclean

all: netspy TCPclient TCPserver UDPclient UDPserver socket netlab-term netlab-gui-web netlab-http

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
	bash -c "cd ./${socket_dir} && autoreconf -if && ./configure ||  cd .."
	$(MAKE) -C ${socket_dir}
	cp ${socket_dir}/src/sock socket

dockers: netlab-gui-web
gns3-ipterm:
	docker pull gns3/ipterm
gns3-webterm:
	docker pull gns3/webterm

docker-pull-base:
	docker pull debian:10
	docker pull dorowu/ubuntu-desktop-lxde-vnc

netlab-term: netspy socket TCPserver UDPserver TCPclient UDPclient
	docker build -t ut/netlab/term -t ut/netlab/term:$(docker_tag) -f term.Dockerfile .
netlab-gui: netlab-term
	docker build -t ut/netlab/gui -t ut/netlab/gui:$(docker_tag) -f gui.Dockerfile .
netlab-gui-web: netlab-term
	docker build -t ut/netlab/gui -t ut/netlab/gui:$(docker_tag) -f gui.web.Dockerfile .
	docker build -t ut/netlab/gui-s -t ut/netlab/gui-s:$(docker_tag) -f gui.simple.Dockerfile .
netlab-http:
	docker build -t ut/netlab/http-server -t ut/netlab/http-server:$(docker_tag) -f http/http.Dockerfile ./http/

dockers-push:
	docker commit ut/netlab/term
	docker commit ut/netlab/gui
	docker push $(docker_registery)/ut/netlab/term
	docker push $(docker_registery)/ut/netlab/gui

clean-docker:
	docker rmi ut/netlab/gui:$(docker_tag)
	docker rmi ut/netlab/gui-s:$(docker_tag)
	docker rmi ut/netlab/term:$(docker_tag)
