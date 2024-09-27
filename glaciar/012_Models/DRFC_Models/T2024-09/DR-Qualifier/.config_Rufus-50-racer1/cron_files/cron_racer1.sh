#!/bin/bash

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2,4    7 3 *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes - en marzo
    
# 30 1      7 3 *  comando_inicial   (entrena 1.30)
# 10 3      7 3 *  comando_wip1

# */45 * 24,25 8 *    Cada 45 minutos del 24 y 25 de agosto ..

# 0 * 11,12 9 *  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-09/DR-Qualifier/.config_Luna-50-racer1/cron_files/cron_racer2.sh

# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)
MY_NAME=$(date +d%dh%H%M)


MODEL_FOLDER=Luna-50-racer1
MODEL_NOMBRE=Luna-50-racer1-${MY_NAME}

PROFILE=racer2
ROLE_ARN=arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole
BUCKET_AWS=dr-models-racer2-dots-to-pabloedu-gmail
BUCKET_MINIO=dr-models-racer1

echo "${MY_TIME} CRONTAB - ${PROFILE}" >> ~/logs.crontab

# 10 3      7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-08/DR-Qualifier/.config_Luna-50-racer1/cron_files/cron_fase_wip1.sh
# */45 * 27,28 8 *  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-08/DR-Qualifier/.config_Luna-50-racer1/cron_files/cron_fase_wip1.sh

0 * 11,12 9 *  /home/ubuntu/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-09/DR-Qualifier/.config_Luna-50-racer1/cron_files/cron_fase_racer1.sh


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



