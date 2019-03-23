CC=gcc
socket_url=http://www.icir.org/christian/downloads/sock-0.3.2.tar.gz
socket_dir=sock
docker_registery=hub.docker.com

.PHONY: default all clean
default: all

clean:
	rm -f netspy netspyd netspydd TCPclient TCPserver UDPclient UDPserver socket
	$(MAKE) -C $(socket_dir) clean

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

dockers: netlab-term netlab-gui
gns3-ipterm:
	docker pull gns3/ipterm
gns3-webterm:
	docker pull gns3/webterm
netlab-term: netspy socket TCPserver UDPserver gns3-ipterm
	docker build -t utnetlab/ipterm -f term.Dockerfile .
netlab-gui: netlab-term gns3-webterm
	docker build -t utnetlab/ipgui -f gui.Dockerfile .
dockers-push:
	docker commit utnetlab/term
	docker commit utnetlab/gui
	docker push $(docker_registery)/utnetlab/term
	docker push $(docker_registery)/utnetlab/gui
