#!/bin/bash

if [[ ! -z ${HTUSER+x} && ! -z ${HTPASS+x} ]]; then
        htpasswd -b -c /etc/apache2/.htpasswd ${HTUSER} ${HTPASS}
        a2ensite 000-default-auth.conf
        a2dissite 000-default.conf
fi

if [[ ! -z ${RTORRENT_PORT+x} ]]; then
	sed -i -e "s/51001-51001/${RTORRENT_PORT}/g" /home/rtorrent/.rtorrent.rc
fi

su rtorrent bash -c "/usr/bin/tmux -2 new-session -d -s rtorrent rtorrent"
/usr/sbin/apache2ctl -D FOREGROUND
