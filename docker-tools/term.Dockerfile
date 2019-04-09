# FROM gns3/ipterm

# docker base image for basic networking tools

FROM debian:jessie

RUN set -ex \
    && apt-get update \
#
# compile and install mtools (msend & mreceive)
#
    && dpkg-query -f '${binary:Package}\n' -W | sort > base_packages \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        gcc libc6-dev make curl ca-certificates \
    && curl -OL https://github.com/troglobit/mtools/releases/download/v2.3/mtools-2.3.tar.gz \
    && tar xfz mtools-2.3.tar.gz \
    && cd mtools-2.3 \
    && make \
    && make install \
    && cd .. \
    && rm -r mtools-2.3* \
    && dpkg-query -f '${binary:Package}\n' -W | sort > packages \
    && DEBIAN_FRONTEND=noninteractive apt-get -y purge \
        `comm -13 base_packages packages` \
    && rm -f base_packages packages \
#
# install remaining tools
#
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        net-tools tcpdump telnet traceroute curl iperf3 knot-host openssh-client mtr-tiny socat nano vim-tiny \
        sudo bash-completion isc-dhcp-client telnetd telnet tcpdump ftp openssh-client wget iputils-ping netcat screen  xinetd less man-db arping iproute openssh-server ftp vsftpd nano vim iptables ntp ntpdate tftpd tftp rdate isc-dhcp-server \
    && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/archives/*.deb

# add netlab user
RUN useradd -m netlab -s /bin/bash && \
    adduser netlab sudo && echo "netlab:netlab" | chpasswd netlab && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# enable xinetd and vsftp service
RUN sed -i 's/= yes/= no/g' /etc/xinetd.d/time && \
    sed -i 's/= yes/= no/g' /etc/xinetd.d/echo && \
    su netlab -c 'cd; truncate -s 10K small.dum; truncate -s 1M med.dum; truncate -s 50M larg.dum'

# config system
COPY telnet tftp vsftp /etc/xinetd.d/
COPY bashrc /root/.bashrc
COPY bashrc /home/netlab/.bashrc

# copy program file
COPY netspy netspyd netspydd TCPserver UDPclient UDPserver TCPclient socket /usr/local/bin/

# start service and bash
VOLUME [ "/root" ]
CMD [ "sh", "-c", "echo Salam; service xinetd start; cd; exec bash -i" ]
