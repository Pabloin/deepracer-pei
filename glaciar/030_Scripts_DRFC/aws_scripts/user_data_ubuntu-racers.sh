#!/bin/bash
apt update -y
apt install -y git
apt install -y tree dos2unix
apt install -y unzip
apt install -y python3-pip
apt install -y net-tools

HOME_ROOT=/root
HOME_USER=/home/ubuntu
HOME_PROFILE_S3=dr-racers-config
# HOME_PROFILE_S3=dr-racer1-stoc-config
# HOME_PROFILE_S3=dr-racer1-config
# HOME_PROFILE_S3=dr-racer2-config
# HOME_PROFILE_S3=dr-racers-config-peze

# INTALL: 0- Set Home
# INTALL: 1- AWS CLI
# INTALL: 2- Docker (CE)
# INTALL: 3- Git Clone
# INTALL: 4- DeepRacer Utils

# INTALL: 0- Set Home
cd ${HOME_ROOT}

# INTALL: 1- AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm awscliv2.zip


# INTALL 2 -Docker (CE) en Ubutntu 22
# Basado en:
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04

apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update -y
apt-cache policy docker-ce
apt install -y docker-ce docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl status docker
usermod -aG docker ubuntu


# Installing NVIDIA Container Toolkit GPG Keys on Ubuntu 22.04:

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  | tee /etc/apt/sources.list.d/docker.list > /dev/null

# vim /etc/apt/sources.list.d/nvidia-container-toolkit.list

# deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu18.04/$(ARCH) /
# #deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu22.04/$(ARCH) /

cat << EOM > /etc/apt/sources.list.d/nvidia-container-toolkit.list

deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu18.04/\$(ARCH) /
#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu22.04/\$(ARCH) /

EOM
apt update -y
apt install -y nvidia-docker2

sudo service docker stop
sudo service docker start

# Se necesita un Reboot tambien ...?
# sudo reboot

# Checking if NVIDIA GPU is Accessible from Docker Containers in Ubuntu 22.04 LTS:
docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu20.04 nvidia-smi




# INSTALL y VERIFICAR NVIDIA DRRIVERS (WIP)
# https://linuxhint.com/install-nvidia-drivers-on-ubuntu/
apt -y install nvidia-driver-510
# Necesita REBOOT ... 
lsmod | grep nvidia
nvidia-smi


# INTALL: 2- Git Clone
# No es nyuy seguro, hay cambiarlo
# Copia al Usuario root primero
aws s3 cp s3://${HOME_PROFILE_S3}/id_rsa-racers           .ssh/id_rsa
aws s3 cp s3://${HOME_PROFILE_S3}/id_rsa-racers.pub       .ssh/id_rsa.pub
aws s3 cp s3://${HOME_PROFILE_S3}/known_hosts_finger_git  .ssh/known_hosts

dos2unix   .ssh/id_rsa
chmod 400  .ssh/id_rsa

cp .ssh/id_rsa         ${HOME_USER}/.ssh/id_rsa
cp .ssh/id_rsa.pub     ${HOME_USER}/.ssh/id_rsa.pub

chown ubuntu  ${HOME_USER}/.ssh/id_rsa
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa
chown ubuntu  ${HOME_USER}/.ssh/id_rsa.pub
chgrp ubuntu  ${HOME_USER}/.ssh/id_rsa.pub


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



# INTALL: FINAL - My Ubuntu INIT

cat << EOM >> ${HOME_USER}/my_ubuntu_init.sh


# INTALL: A - DeepRacer Utils
pip3 install deepracer-utils
python3 -m deepracer install-cli --force



# INSTALL: B - CONDA (En WIP y &)
curl --output ~/anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x      ~/anaconda.sh


# VErificacion NVIDIA
lsmod | grep nvidia
nvidia-smi
# Checking if NVIDIA GPU is Accessible from Docker Containers in Ubuntu 22.04 LTS:
docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu20.04 nvidia-smi


# INSTALL: C - DOTS Prepare
cd ~/deepracer-pei/deepracer-for-cloud && ./bin/prepare.sh




# # INSTALL
# # NVM - NPM y CDK
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# source ~/.bashrc
# nvm install --lts 18
# npm install -g aws-cdk
# nvm  --version
# node --version
# cdk  --version


EOM

chown ubuntu  ${HOME_USER}/my_ubuntu_init.sh
chgrp ubuntu  ${HOME_USER}/my_ubuntu_init.sh
chmod +x      ${HOME_USER}/my_ubuntu_init.sh


