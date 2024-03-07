#!/bin/bash

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2,4    7 3 *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes - en marzo
    
# 30 1      7 3 *  comando_inicial   (entrena 1.30)
# 10 3      7 3 *  comando_wip1


#--------------------
# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:10 7/3



MODEL_FOLDER=Pg3-0200
# MODEL_NOMBRE=Pg3-0200-R2-Inicial
MODEL_NOMBRE=Pg3-0200-R2-Wip1


# 10 3      7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_fase_wip1.sh


cat << EOM

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

read -p "Hacemos DW & UP? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || return 1


aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODEL_FOLDER} \
        s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODEL_FOLDER} \
                --profile racer2



