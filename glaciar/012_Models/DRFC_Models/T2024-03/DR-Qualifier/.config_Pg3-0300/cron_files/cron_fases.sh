#!/bin/bash

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

#--------------------
# INITIAL - Training 1.30 hs - ( 90 minutos) | GMT-3: 22:00 a (23:30      osea 02:30)
# WIP_1   - Training 3.00 hs - (180 minutos) | GMT-3: 22:00 a (01:00 (+1) osea 04:00) 8/3
# WIP_2   - Training 4.50 hs - (270 minutos) | GMT-3: 22:00 a (02:30 (+1) osea 05:30) 8/3
# CIERRE  - Training 6.00 hs - (360 minutos) | GMT-3: 22:00 a (04:00 (+1) osea 07:00) 8/3
#--------------------

# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)


echo "${MY_TIME} CRONTAB - FASE WIP" >> ~/logs.crontab
echo "${MY_TIME} FASES ${1}        " >> ~/logs.crontab

#TODO - Sacar del environment ...


modelVersion=$1
shift

MODEL_FOLDER=Pg3-0300q
MODEL_NOMBRE=Pg3-0300q-R2-${modelVersion}



# 10 3   8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Inicial
# 10 3   8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Wip1
# 10 3   8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Wip2
# 10 3   8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Final

cat << EOM >> ~/logs.crontab

    CRONTAB_DE: ${MY_TIME}

    mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODEL_FOLDER}
                /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

    cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

    ls -la

    aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODEL_FOLDER} 
        s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODEL_FOLDER}
        --profile racer2

EOM


mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODEL_FOLDER}  \
            /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

ls -la


#----------------

aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODEL_FOLDER} \
    s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODEL_FOLDER} \
    --profile racer2


#----------------

cat << EOM >> ~/logs.crontab

    CRONTAB_DE: ${MY_TIME}

    aws deepracer import-model 
        --type REINFORCEMENT_LEARNING 
        --name ${MODEL_NOMBRE}  
        --model-artifacts-s3-path s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODEL_FOLDER} 
        --role-arn arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole
        --region   us-east-1
        --profile  racer2

EOM


aws deepracer import-model \
    --type REINFORCEMENT_LEARNING \
    --name ${MODEL_NOMBRE}  \
    --model-artifacts-s3-path s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODEL_FOLDER} \
    --role-arn arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole \
    --region   us-east-1 \
    --profile  racer2



if [[ "${modelVersion}" == "Close" ]];
then
    echo "Es la versión close y ejecotamos  dr-stop-training " >> ~/logs.crontab
    dr-stop-training
fi


