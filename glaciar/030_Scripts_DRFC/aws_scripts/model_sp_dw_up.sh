#!/bin/bash

MODELO_NAME=Pg3-0100w
MODELO_ALIAS=Pg3-0100w-R2-Closed

cat << EOM

        mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODELO_NAME}
                    /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

        cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

        ls -la

        aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODELO_NAME} 
                     s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODELO_NAME}
                     --profile racer2

EOM

mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODELO_NAME}  \
            /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

ls -la


#----------------

read -p "Hacemos DW & UP? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || return 1


aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODELO_NAME} \
        s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODELO_NAME} \
                --profile racer2



