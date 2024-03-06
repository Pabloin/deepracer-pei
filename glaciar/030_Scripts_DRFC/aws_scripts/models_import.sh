#!/bin/bash


# Hard de Minio Down ... 
# Minio up S3 e import
# Todo eso con un cron cada una hora ... 


# Hard 1 [spDown_minio]

MODELO_NAME=Pg3-0100x

    mc cp myminio/bucket-models-2024-03/DR-Qualifier/${MODELO_NAME}
          /home/ubuntu/MINIO_SYNC/DR-Qualifier/ --recursive

    cd  /home/ubuntu/MINIO_SYNC/DR-Qualifier

    ls -la

