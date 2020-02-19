FROM dorowu/ubuntu-desktop-lxde-vnc

COPY ssl /etc/nginx/ssl
ENV SSL_PORT=443

RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install ifupdown