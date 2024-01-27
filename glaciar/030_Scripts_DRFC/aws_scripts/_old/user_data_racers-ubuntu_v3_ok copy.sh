#!/bin/bash
apt update -y
apt install -y git
apt install -y tree dos2unix
apt install -y unzip
apt install -y python3-pip

HOME_ROOT=/root
HOME_USER=/home/ubuntu
# HOME_PROFILE_S3=dr-racers-config
HOME_PROFILE_S3=dr-racers-config-peze

# INTALL: 0- Set Home
# INTALL: 1- AWS CLI
# INTALL: 2- Git Clone
# INTALL: 3- DeepRacer Utils

# INTALL: 0- Set Home
cd ${HOME_ROOT}

# INTALL: 1- AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm awscliv2.zip


# INTALL: 2- Git Clone
# No es nyuy seguro, hay cambiarlo
# Copia al Usuario root primero
aws s3 cp s3://${HOME_PROFILE_S3}/id_rsa-racers           .ssh/id_rsa
aws s3 cp s3://${HOME_PROFILE_S3}/id_rsa-racers.pub       .ssh/id_rsa.pub
aws s3 cp s3://${HOME_PROFILE_S3}/known_hosts_finger_git  .ssh/known_hosts

dos2unix   .ssh/id_rsa
chmod 400  .ssh/id_rsa

# dos2unix .ssh/id_rsa.pub
# dos2unix .ssh/known_hosts

cp .ssh/id_rsa         ${HOME_USER}/.ssh/id_rsa
cp .ssh/id_rsa.pub     ${HOME_USER}/.ssh/id_rsa.pub
# cp .ssh/known_hosts    ${HOME_USER}/.ssh/known_hosts

chown ubuntu  ${HOME_USER}/.ssh/id_rsa
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa
chown ubuntu  ${HOME_USER}/.ssh/id_rsa.pub
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa.pub
# chown ubuntu  ${HOME_USER}/.ssh/known_hosts
# chgrp ubuntu  ${HOME_USER}/.ssh/known_hosts



# Profile root para Git Clone (root hace git clone)
cd ${HOME_USER}

git clone git@github.com:Pabloin/deepracer-pei.git

chown ubuntu -R  ${HOME_USER}/deepracer-pei
chgrp ubuntu -R  ${HOME_USER}/deepracer-pei

cd ${HOME_USER}/deepracer-pei

git config user.name  Pabloin
git config user.email pablo.ezequiel.inchausti@gmail.com



# INSTALL ADD PROFILE
cd ${HOME_USER}

echo "Hello en Home User Ubuntu " > ${HOME_USER}/hello.txt

cat << EOM >> ${HOME_USER}/.bashrc

# Ubuntu en .bashrc
export BASH_DRFC=~/deepracer-pei/glaciar/030_Scripts_DRFC
# if bash dots
if [ -f "\$BASH_DRFC/.bashDRFC" ]; then
    echo "Hola"
    . "\$BASH_DRFC/.bashDRFC"
fi

EOM

cd ${HOME_USER}/deepracer-pei/deepracer-for-cloud && ./bin/prepare.sh



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



