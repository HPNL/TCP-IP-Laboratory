# docker run --name mininet --privileged -p 6080:80 -p 5900:5900 -v /dev/shm:/dev/shm -v /lib/modules:/lib/modules  -d utnetlab/mininet
FROM dorowu/ubuntu-desktop-lxde-vnc

COPY ssl /etc/nginx/ssl
ENV SSL_PORT=443

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        mininet wireshark openvswitch-switch curl iproute2 iputils-ping ifupdown net-tools tcpdump vim \
    && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/archives/*.deb

RUN sed -i 's#exec /bin/tini#service openvswitch-switch start\nexec /bin/tini#g' /startup.sh
#ENTRYPOINT ["/startup.sh"]