#!/bin/bash


# Hard de Minio Down ... 
# Minio up S3 e import
# Todo eso con un cron cada una hora ... 


# Hard 1 [spDown_minio]

MODELO_NAME=Pg3-0100x
MODELO_ALIAS=Pg3-0100x-R2-Closed

mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODELO_NAME} \
        /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

ls -la

#----------------

aws s3 sync  /home/ubuntu/MINIO_SYNC/DR-Qualifier/${MODELO_NAME} \
        s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/Pg3-0100x \
                --profile racer2


#----------------

aws deepracer import-model \
    --type REINFORCEMENT_LEARNING \
    --name ${MODELO_ALIAS}  \
    --model-artifacts-s3-path s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODELO_NAME} \
    --role-arn arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole \
    --profile  racer2


