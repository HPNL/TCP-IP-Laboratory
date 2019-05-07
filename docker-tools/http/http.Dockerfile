# FROM gns3/ipterm

# docker base image for basic http query

FROM debian:jessie

RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        htop bash-completion less man-db curl wget nano vim \
        net-tools tcpdump isc-dhcp-client iputils-ping \
        netcat iproute iproute2 apache2 perl php5 libapache2-mod-php5 \
    && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/archives/*.deb
# apache2-utils

COPY hello.pl hello.php index.html try1.html try2.html logo.png /var/www/html/

# start service and bash
WORKDIR /root/
VOLUME [ "/root" ]
CMD [ "sh", "-c", "echo Salam; service apache2 start; cd; exec bash -i" ]
