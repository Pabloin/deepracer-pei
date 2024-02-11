#!/bin/bash
apt update -y
apt install -y git
apt install -y tree jq dos2unix
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


# INTALL: 1- MINIO CLIENT
curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs \
      -o $HOME/minio-binaries/mc
chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/



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

# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  | tee /etc/apt/sources.list.d/docker.list > /dev/null

# # vim /etc/apt/sources.list.d/nvidia-container-toolkit.list

# # deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu18.04/$(ARCH) /
# # #deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu22.04/$(ARCH) /

# cat << EOM > /etc/apt/sources.list.d/nvidia-container-toolkit.list

# deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu18.04/\$(ARCH) /
# #deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/ubuntu22.04/\$(ARCH) /

# EOM

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get -y update 
sudo apt-get -y install nvidia-container-toolkit

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
function gitClone() {

    cd ${HOME_USER}

    # git clone git@github.com:Pabloin/deepracer-pei.git
    # git clone git@github.com:Pabloin/deepracer-on-the-spot-pei.git

    git clone git@github.com:Pabloin/${GIT_REPO_NAME}.git

    chown ubuntu -R  ${HOME_USER}/${GIT_REPO_NAME}
    chgrp ubuntu -R  ${HOME_USER}/${GIT_REPO_NAME}

    cd ${HOME_USER}/${GIT_REPO_NAME}

    git config user.name  Pabloin
    git config user.email pablo.ezequiel.inchausti@gmail.com

    cd ${HOME_USER}
}


GIT_REPO_NAME=deepracer-pei;               
gitClone

GIT_REPO_NAME=deepracer-on-the-spot-pei;   
gitClone


# INSTALL ADD PROFILE
cd ${HOME_USER}

echo "Hello en Home User Ubuntu " > ${HOME_USER}/hello.txt
chown ubuntu  ${HOME_USER}/hello.txt
chgrp ubuntu  ${HOME_USER}/hello.txt

cat << EOM >> ${HOME_USER}/.bashrc

# DOTS - DRFC
# export BASTION_CONFIG=DOTS
export BASTION_CONFIG=DRFC

if [ "\${BASTION_CONFIG}" = 'DRFC' ]; then

    echo "Bastion DRFC"
    # Ubuntu en .bashrc
    export BASH_DRFC=~/deepracer-pei/glaciar/030_Scripts_DRFC
    # if bash dots
    if [ -f "\$BASH_DRFC/.bashDRFC" ]; then
        echo "Hola"
        . "\$BASH_DRFC/.bashDRFC"
    fi
fi

if [ "\${BASTION_CONFIG}" = 'DOTS' ]; then

    echo "Bastion DOTS"
    export BASH_DOTS=/home/ubuntu/deepracer-on-the-spot-pei/glaciar/030_Scripts
    # if bash dots
    if [ -f "\${BASH_DOTS}/.bashDotsRc" ]; then
        echo "Hola"
        . "\${BASH_DOTS}/.bashDotsRc"
    fi

    # if bash africa
    if [ -f "\$BASH_DOTS/.bashRegion_Virginia" ]; then
        echo "Hola"
        . "\$BASH_DOTS/.bashRegion_Virginia"
    fi

fi

EOM



# INTALL: FINAL - My Ubuntu INIT

cat << EOM >> ${HOME_USER}/my_ubuntu_init.sh


# INTALL: A - DeepRacer Utils
pip3 install deepracer-utils
python3 -m deepracer install-cli --force
aws deepracer help


# INSTALL: B - CONDA (En WIP y &)
curl --output ~/anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x      ~/anaconda.sh


# UBUNTU DESKTOP
sudo su
passwd ubuntu

# Desktop XFCE
#   Sigo a:
#   https://www.linkedin.com/pulse/setting-up-rdp-ubuntu-aws-ec2-instance-abdul-bhashith
sudo apt-get update
sudo apt-get install -y xrdp
sudo apt-get install -y xfce4
sudo apt-get install -y xfce4-terminal    

# Make xRDP use the environment we just create
sudo sed -i.bak '/fi/a #xrdp multiple users’ configuration \n xfce-session \n' /etc/xrdp/startwm.sh

sudo ufw allow 3389/tcp
sudo /etc/init.d/xrdp restart   

sudo apt install -y firefox


# # INSTALL
# # NVM - NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install --lts 18
nvm  --version
node --version

# # INSTALL CDK
npm install -g aws-cdk
cdk --version




# VErificacion NVIDIA
lsmod | grep nvidia
nvidia-smi
# Checking if NVIDIA GPU is Accessible from Docker Containers in Ubuntu 22.04 LTS:
docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu20.04 nvidia-smi


# MINIO CLIENT
mc alias set myminio/   http://127.0.0.1:9000  Minio_USER  Minio_PASS
mc alias set local/     http://127.0.0.1:9000  Minio_USER  Minio_PASS

pip install minio



# Desktop Nvidia Control Pane
sudo nvidia-settings


# INSTALL: C - DOTS Prepare
cd ~/deepracer-pei/deepracer-for-cloud && ./bin/prepare.sh


# TODO - Extender el SSH desde el SERVER ... 


EOM

chown ubuntu  ${HOME_USER}/my_ubuntu_init.sh
chgrp ubuntu  ${HOME_USER}/my_ubuntu_init.sh
chmod +x      ${HOME_USER}/my_ubuntu_init.sh


