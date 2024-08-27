#!/bin/bash

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2,4    7 3 *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes - en marzo
    
# 30 1      7 3 *  comando_inicial   (entrena 1.30)
# 10 3      7 3 *  comando_wip1


#--------------------
# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:10 7/3
# WIP_2   - Training de 4.50 horas - (270 minutos) - 21:10 a 01:40 (+1) en GMT -3 -- 04:40 7/3
# CIERRE  - Training de 6.00 horas - (360 minutos) - 21:10 a 03:10 (+1) en GMT -3 -- 06:10 7/3


# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)


echo "${MY_TIME} CRONTAB - FASE WIP" >> ~/logs.crontab



MODEL_FOLDER=LuniCar-01
# MODEL_NOMBRE=LuniCar-01-R2-Inicial
MODEL_NOMBRE=LuniCar-01-R2-Cierre


# 10 3      7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-04/DR-Qualifier/.config_LunaCar-06-racer1/cron_files/cron_fase_wip1.sh
# 10 3      7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-04/DR-Qualifier/.config_LunaCar-06-racer1/cron_files/cron_fase_wip1.sh


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
