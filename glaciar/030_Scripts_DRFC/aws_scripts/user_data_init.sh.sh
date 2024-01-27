#!/bin/bash



chown ubuntu -r  ${HOME_USER}/deepracer-pei
chgrp ubuntu -r  ${HOME_USER}/deepracer-pei


cat << EOM >> ${HOME_USER}/.bashrc

# Ubuntu en .bashrc
export BASH_DRFC=~/deepracer-pei/glaciar/030_Scripts_DRFC
# if bash dots
if [ -f "\$BASH_DRFC/.bashDRFC" ]; then
    echo "Hola"
    . "\$BASH_DRFC/.bashDRFC"
fi

EOM



git clone git@github.com:Pabloin/deepracer-pei.git


cd ${HOME_USER}/deepracer-pei/deepracer-for-cloud && ./bin/prepare.sh




# INSTALL> 3=CONDA

# curl --output anaconda.sh \
#      https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh &





