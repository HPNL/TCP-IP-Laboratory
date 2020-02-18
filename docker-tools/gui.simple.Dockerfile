FROM dorowu/ubuntu-desktop-lxde-vnc

COPY ssl /etc/nginx/ssl
ENV SSL_PORT=443
