# FROM gns3/ipterm

# docker base image for basic http query

FROM debian:jessie

RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        htop bash-completion less man-db curl wget nano vim \
        net-tools tcpdump isc-dhcp-client iputils-ping openssl \
        netcat iproute iproute2 apache2 perl php5 libapache2-mod-php5 \
    && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/archives/*.deb \
    # Enable ssl for apache
    && mkdir /etc/apache2/ssl/ \
    && a2enmod ssl \
    && a2ensite default-ssl.conf \
    && sed -i 's/SSLCertificateFile.*pem$/SSLCertificateFile  \/etc\/apache2\/ssl\/server.crt/; s/SSLCertificateKeyFile.*key$/SSLCertificateKeyFile \/etc\/apache2\/ssl\/server.key/;' /etc/apache2/sites-available/default-ssl.conf
# apache2-utils

COPY hello.pl hello.php index.html try1.html try2.html logo.png /var/www/html/
COPY server.key server.crt /etc/apache2/ssl/

# start service and bash
WORKDIR /root/
# VOLUME [ "/root" ]
CMD [ "sh", "-c", "echo Salam; service apache2 start; cd; exec bash -i" ]
