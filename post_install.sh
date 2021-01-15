#!/bin/sh

# Add the following lines to /etc/rc.conf to enable this service:
#
# transmission_enable:	     Set to NO by default. Set it to YES to enable it.
# transmission_watch_dir:    Directory for torrent files to download
#			     automatically. Off by default unless you add
#			     a path.
# transmission_conf_dir:     Directory where transmission configuration
#			     data is stored.
#			     Default: /usr/local/etc/transmission/home
# transmission_download_dir: Directory to store downloaded data.
#			     Default: /usr/local/etc/transmission/home/Downloads
# transmission_user:	     The user account transmission daemon runs as what
#			     you want it to be. It uses 'transmission' user by
#			     default.
# transmission_web_home:     Use alternative directory for the web interface
#			     files, such as javascript, html and graphics.
# transmission_chown:	     By default, transmission checks and fixes the
#			     permissions for its home directory.  If this
#			     causes problems, set this variable to no.


# set the config location
TRANSMISSION_CONFIG_DIR="/app-data/transmission"

# set the download location
TRANSMISSION_DOWNLOAD_DIR="/app-data/Downloads"

# create the data locations
mkdir -p $TRANSMISSION_CONFIG_DIR
mkdir -p $TRANSMISSION_DOWNLOAD_DIR

# make "transmission" the owner of the data locations
chown -R transmission:transmission $TRANSMISSION_CONFIG_DIR

# give write permission for plugin update
chmod 755 $TRANSMISSION_CONFIG_DIR

# enable transmission to start at boot
sysrc "transmission_enable=YES"

# set the location for transmission configuration directory
sysrc "transmission_conf_dir=$TRANSMISSION_CONFIG_DIR"

# change transmission's group to be media
#pw usermod transmission -g media

# start the transmission service
service transmission start
