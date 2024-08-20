# deepracer-pei

Log Analisi dentro del docker

necesito un 

ln -s  

C:\Users\pablo\AWS DeepRacer\deepracer-pei\glaciar\012_Models\DRFC_Models\T2024-03\DR-Analysis\README.md

(o un cp ... ) (o un mount de docker)

# True to get logs mounted to `$DR_DIR/data/logs/robomaker/$DR_LOCAL_S3_MODEL_PREFIX`
DR_ROBOMAKER_MOUNT_LOGS=True


ubuntu@ip-172-31-22-48:~/deepracer-pei/deepracer-for-cloud$ find . -name *ipy*
./data/analysis/.ipynb_checkpoints
./data/analysis/.ipynb_checkpoints/Pg3-0100a-Metrics-checkpoint.ipynb
./data/analysis/Pg3-0100/Pg3-0100a-Metrics.ipynb
./data/analysis/Pg3-0100/.ipynb_checkpoints
./data/analysis/Pg3-0100/.ipynb_checkpoints/Pg3-0100-Metrics-checkpoint.ipynb
./data/analysis/Pg3-0100/Pg3-0100-Metrics.ipynb


~/deepracer-pei/deepracer-for-cloud/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis

#----------------
cd ~/deepracer-pei/deepracer-for-cloud/data/analysis/
ln -s ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis  \
      LN-S-Pg3-0100


export GLACIAR_ANALYSIS=~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis

docker run -t -i -v ${GLACIAR_ANALYSIS}:<container_dir>  ubuntu /bin/bash

docker run -d --name some-container -v ${PWD}/folder:/var/folder ubuntu

docker run -d --name 9a3bf46146e0 -v ${GLACIAR_ANALYSIS}:/workspace/glaciar-analisys ubuntu

9a3bf46146e0   awsdeepracercommunity/deepracer-analysis:cpu               "/bin/sh -c 'jupyter…"   2 hours ago      Up 2 hours                  0.0.0.0:8888->8888/tcp, :::8888->8888/tcp   deepracer-analysis



#---------

ubuntu@ip-172-31-22-48:~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis$ docker ps -a  | grep ana
9a3bf46146e0   awsdeepracercommunity/deepracer-analysis:cpu               "/bin/sh -c 'jupyter…"   2 hours ago      Up 2 hours                  0.0.0.0:8888->8888/tcp, :::8888->8888/tcp   deepracer-analysis

ubuntu@ip-172-31-22-48:~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis$ docker inspect -f "{{ .Mounts }}" 9a3bf46146e0
[{bind  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis /workspace/glaciar-analisys   true rprivate}]



docker run -t -i -v <host_dir>:<container_dir>  ubuntu /bin/bash
#----------------



cp -r ~/deepracer-pei/deepracer-for-cloud/data/analysis/Pg3-0100 \
      ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis


cp    ~/deepracer-pei/deepracer-for-cloud/data/analysis/Pg3-0100 \
      ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis

sudo cp \
      ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis/Pg3-0100/Pg3* \
      ~/deepracer-pei/deepracer-for-cloud/data/analysis/Pg3-0100

