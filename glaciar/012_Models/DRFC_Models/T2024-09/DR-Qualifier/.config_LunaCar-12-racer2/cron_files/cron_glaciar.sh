#!/bin/bash

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2,4    7 3 *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes - en marzo
    
# 30 1      7 3 *  comando_inicial   (entrena 1.30)
# 10 3      7 3 *  comando_wip1

# */45 * 24,25 8 *    Cada 45 minutos del 24 y 25 de agosto ..


#--------------------
# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:10 7/3
# WIP_2   - Training de 4.50 horas - (270 minutos) - 21:10 a 01:40 (+1) en GMT -3 -- 04:40 7/3


# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)
MY_NAME=$(date +d%dh%H%M)


MODEL_FOLDER=LunaCar-11-racer2
MODEL_NOMBRE=LunaCar-11-racer2-${MY_NAME}

PROFILE=glaciar
ROLE_ARN=arn:aws:iam::845305768689:role/service-role/AWSDeepRacerAccessRole
BUCKET_AWS=deepracer-forcloud-glaciar
BUCKET_MINIO=dr-models-glaciar-dots-to-pabloedu-gmail

echo "${MY_TIME} CRONTAB - ${PROFILE}" >> ~/logs.crontab

# 10 3      7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-08/DR-Qualifier/.config_LunaCar-11-glaciar/cron_files/cron_wip1.sh
# */45 * 27,28 8 *  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-08/DR-Qualifier/.config_LunaCar-11-glaciar/cron_files/cron_wip1.sh

# 0 * 11,12 9 *  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-09/DR-Qualifier/.config_LunaCar-12-racer2/cron_files/cron_glaciar.sh


cat << EOM >> ~/logs.crontab

        CRONTAB_DE: ${MY_TIME}

        mc cp myminio/${BUCKET_MINIO}/DR-Qualifier/${MODEL_FOLDER}
                        /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

        cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

        ls -la

        aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODEL_FOLDER}
                          s3://${BUCKET_AWS}/DR-Qualifier/${MODEL_FOLDER}
                          --profile ${PROFILE}

EOM

mc cp myminio/${BUCKET_MINIO}/DR-Qualifier/${MODEL_FOLDER}  \
            /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

ls -la


#----------------

aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODEL_FOLDER} \
             s3://${BUCKET_AWS}/DR-Qualifier/${MODEL_FOLDER} \
             --profile ${PROFILE}


#----------------

cat << EOM >> ~/logs.crontab

        CRONTAB_DE: ${MY_TIME}

        aws deepracer import-model
                --type REINFORCEMENT_LEARNING
                --name ${MODEL_NOMBRE} 
                --model-artifacts-s3-path s3://${BUCKET_AWS}/DR-Qualifier/${MODEL_FOLDER}
                --role-arn ${ROLE_ARN}
                --region   us-east-1
                --profile ${PROFILE}

EOM


aws deepracer import-model \
    --type REINFORCEMENT_LEARNING \
    --name ${MODEL_NOMBRE}  \
    --model-artifacts-s3-path s3://${BUCKET_AWS}/DR-Qualifier/${MODEL_FOLDER} \
    --role-arn ${ROLE_ARN} \
    --region   us-east-1 \
    --profile ${PROFILE}



