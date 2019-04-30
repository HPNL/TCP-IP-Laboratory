FROM utnetlab/ipterm

# docker image with basic networking tools and web browser

# FROM gns3/ipterm-base

# minimal init, see https://github.com/Yelp/dumb-init
ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/sbin/dumb-init

RUN set -ex \
    && chmod 755 /usr/local/sbin/dumb-init \
    && apt-get update \
#
# install web tools
#
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        firefox-esr lxterminal jwm menu leafpad apache2-utils vlc \
    && rm -rf /var/lib/apt/lists/* \
    && /bin/echo -e '\
\x23!/bin/sh\n\
\n\
\x23 use home page on first start\n\
[ -e "$HOME/.mozilla" ] || start_url="about:home"\n\
\n\
\x23 start firefox\n\
start=$(date +%s)\n\
firefox $start_url\n\
status=$?\n\
\n\
\x23 workaround: restart firefox, if it crashes during initialization\n\
if [ $status -eq 139 -a $(($(date +%s)-start)) -le 10 ]; then\n\
	firefox $start_url\n\
fi' \
        > /usr/local/bin/start-firefox && chmod +x /usr/local/bin/start-firefox \
    && /bin/echo -e '\
?package(firefox-esr):\\\n\
 needs="x11"\\\n\
 section="Applications"\\\n\
 title="Mozilla Firefox"\\\n\
 command="start-firefox"' \
        > /etc/menu/firefox \
    && echo "postrun="\""sed -i '/^    </ d' debian-menu"\" >> /etc/menu-methods/jwm \
    && sed -i 's/\(Desktops width\)="[0-9]*"/\1="2"/' /etc/jwm/system.jwmrc \
    && update-menus \
    && mkdir -p /root/.config/lxterminal \
    && /bin/echo -e '\
[general]\n\
scrollback=1000\n\
fgcolor=#ffffff' \
        > /root/.config/lxterminal/lxterminal.conf \
    && /bin/echo -e '\
\x23!/bin/sh\n\
[ $$ -eq 1 ] && exec dumb-init "$0" "$@"\n\
\n\
cd\n\
export SHELL=/bin/bash\n\
\x23start-firefox &\n\
jwm' \
        > /etc/init.sh && chmod +x /etc/init.sh

# Disable root check for vlc
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc

COPY group.mp4 /home/netlab/

CMD [ "/etc/init.sh" ]
