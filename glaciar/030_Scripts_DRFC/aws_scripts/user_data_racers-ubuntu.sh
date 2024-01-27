#!/bin/bash
apt update -y
apt install -y git
apt install -y tree dos2unix
apt install -y unzip
apt install -y python3-pip


# INTALL: 1- AWS CLI
# INTALL: 2- DeepRacer Utils
# INTALL: 3- Git Clone

HOME_USER=/home/ubuntu
cd ${HOME_USER}

# INTALL: 1- AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm awscliv2.zip


# INTALL: 3- Git Clone
# No es nyuy seguro, hay cambiarlo
aws s3 cp s3://dr-racers-config/id_rsa-racers       ${HOME_USER}/.ssh/id_rsa
aws s3 cp s3://dr-racers-config/id_rsa-racers.pub   ${HOME_USER}/.ssh/id_rsa.pub

dos2unix ${HOME_USER}/.ssh/id_rsa
dos2unix ${HOME_USER}/.ssh/id_rsa.pub

chmod 400  ${HOME_USER}/.ssh/id_rsa

chown ubuntu  ${HOME_USER}/.ssh/id_rsa
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa
chown ubuntu  ${HOME_USER}/.ssh/id_rsa.pub
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa.pub


git clone git@github.com:Pabloin/deepracer-pei.git

chown ubuntu -r  ${HOME_USER}/deepracer-pei.git
chgrp ubuntu -r  ${HOME_USER}/deepracer-pei.git


cat << EOM >> ${HOME_USER}/.bashrc

# Ubuntu en .bashrc
export BASH_DRFC=~/deepracer-pei/glaciar/030_Scripts_DRFC
# if bash dots
if [ -f "\$BASH_DRFC/.bashDRFC" ]; then
    echo "Hola"
    . "\$BASH_DRFC/.bashDRFC"
fi

EOM



# INTALL: 2- DeepRacer Utils
pip3 install deepracer-utils
python3 -m deepracer install-cli --force



# INSTALL> 3=CONDA
# curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh


# pip install deepracer-utils

# python3 -m deepracer install-cli --force

#
# TODO:

# No quierlo levantar el apache

# Quiero instalar el DR Utils ...


# Instalar Conda



