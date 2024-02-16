#!/bin/bash

# Script to install basic X-Windows on a headless instance (e.g. in EC2)

# Install additional packages
sudo apt-get install xinit xserver-xorg-legacy x11-xserver-utils x11-utils \
                    menu mesa-utils xterm mwm x11vnc pkg-config screen -y --no-install-recommends

# Configure
sudo sed -i -e "s/console/anybody/" /etc/X11/Xwrapper.config
BUS_ID=$(nvidia-xconfig --query-gpu-info | grep "PCI BusID" | cut -f2- -d: | sed -e 's/^[[:space:]]*//' | head -1)
sudo nvidia-xconfig --busid=$BUS_ID -o $DR_DIR/tmp/xorg.conf

touch ~/.Xauthority

sudo tee -a $DR_DIR/tmp/xorg.conf << EOF

Section "DRI"
        Mode 0666
EndSection
EOF


# NOTAS PEI
# PARA QUE FUNCIONE TUVE QUE HACER DOS COSAS
# a) Instalar DEV
# b) Restar / reboot
#       sudo apt-get install xserver-xorg-dev
#       sudo apt-get install xutils-dev
#       ./setup-xorg.sh
#        dpkg -S xorg-server.pc
#       reboot ..

