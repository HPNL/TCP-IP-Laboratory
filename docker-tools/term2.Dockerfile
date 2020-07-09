# docker base image for basic networking tools

# FROM gns3/ipterm
# FROM ubuntu:18.04
FROM debian:10

#
# compile and install mtools (msend & mreceive)
#

RUN apt-get update \
    && dpkg-query -f '${binary:Package}\n' -W | sort > base_packages \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        libc6-dev make curl ca-certificates build-essential autoconf automake autotools-dev \
    && curl -OL https://github.com/troglobit/mtools/releases/download/v2.3/mtools-2.3.tar.gz \
    && tar xfz mtools-2.3.tar.gz \
    && cd mtools-2.3 \
    && make \
    && make install \
    && cd .. \
    && rm -r mtools-2.3* \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        sudo htop bash-completion screen less man-db  curl wget socat knot-host mtr-tiny nano vim \
        net-tools iperf3 traceroute tcpdump isc-dhcp-client isc-dhcp-server icmpush iputils-ping \
        xinetd  telnet ftp vsftpd  tftp rdate snmp snmpd ntp ntpdate netcat arping iproute2 openssh-client \
        openssh-server iptables iproute2 openssh-client openssh-server iptables \
        apache2 webalizer goaccess perl \
        tftpd-hpa inetutils-telnetd php php-common libapache2-mod-php openssl \
    && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/archives/*.deb
    #&& dpkg-query -f '${binary:Package}\n' -W | sort > packages \
    #&& DEBIAN_FRONTEND=noninteractive apt-get -y purge \
    #    `comm -13 base_packages packages` 
    # && rm -f base_packages packages \

# add netlab user
RUN useradd -m netlab -s /bin/bash && \
    adduser netlab sudo && echo "netlab:netlab" | chpasswd netlab && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    mkdir /home/netlab/code

# enable xinetd and vsftp service
RUN sed -i 's/= yes/= no/g' /etc/xinetd.d/time && \
    sed -i 's/= yes/= no/g' /etc/xinetd.d/echo && \
    sed -i 's/^mibs :/#mibs :/' /etc/snmp/snmp.conf && \
    mkdir -p /var/run/vsftpd/empty && \
    sed -i 's/listen_ipv6=YES/listen_ipv6=NO/' /etc/vsftpd.conf && \
    su netlab -c 'cd; truncate -s 10K small.dum; truncate -s 1M med.dum; truncate -s 20M large.dum'

# config apache2
RUN mkdir /etc/apache2/ssl/ && \
    mkdir /var/www/html/usage && \
    a2enmod ssl && \
    a2ensite default-ssl.conf && \
    sed -i 's/SSLCertificateFile.*pem$/SSLCertificateFile  \/etc\/apache2\/ssl\/server.crt/; s/SSLCertificateKeyFile.*key$/SSLCertificateKeyFile \/etc\/apache2\/ssl\/server.key/;' /etc/apache2/sites-available/default-ssl.conf

COPY http/hello.pl http/hello.php http/index.html http/try1.html http/try2.html http/logo.png /var/www/html/
COPY http/server.key http/server.crt /etc/apache2/ssl/
COPY http/webalizer.conf /etc/webalizer/
COPY http/goaccess.conf /etc/

# config system
COPY xinetd.d/telnet xinetd.d/tftp xinetd.d/vsftp /etc/xinetd.d/
COPY bashrc /root/.bashrc
COPY bashrc /home/netlab/.bashrc

COPY mibs/* /usr/share/snmp/mibs/
# copy program file
COPY *.c /home/netlab/code/
COPY sock /home/netlab/code/sock

RUN cd /home/netlab/code/ && \
    gcc netspydd.c -o netspydd && \
    gcc netspyd.c -o netspyd && \
    gcc netspy.c -o netspy && \
    gcc TCPclient.c -o TCPclient && \
    gcc TCPserver.c -o TCPserver && \
    gcc UDPclient.c -o UDPclient && \
    gcc UDPserver.c -o UDPserver && \
    cd sock && autoreconf -if && ./configure && make && \
    cp ./src/sock /usr/local/bin/socket && cd .. && rm -rf sock

# start service and bash
WORKDIR /root/
# VOLUME [ "/root" ]
CMD [ "sh", "-c", "echo Salam; service xinetd start; cd; exec bash -i" ]
