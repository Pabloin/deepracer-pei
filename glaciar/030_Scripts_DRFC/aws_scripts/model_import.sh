#!/bin/bash


# Hard de Minio Down ... 
# Minio up S3 e import
# Todo eso con un cron cada una hora ... 

MODELO_NAME=Pg3-0100w
MODELO_ALIAS=Pg3-0100w-R2-Closed

cat << EOM

    aws deepracer import-model 
        --type REINFORCEMENT_LEARNING 
        --name ${MODELO_ALIAS}  
        --model-artifacts-s3-path s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODELO_NAME} 
        --role-arn arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole 
        --region   us-east-1 
        --profile  racer2

EOM

read -p "Hacemos Import? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || return 1

aws deepracer import-model \
    --type REINFORCEMENT_LEARNING \
    --name ${MODELO_ALIAS}  \
    --model-artifacts-s3-path s3://dr-models-racer2-dots-to-pabloedu-gmail/DR-Qualifier/${MODELO_NAME} \
    --role-arn arn:aws:iam::590184033458:role/AWSDeepRacerAccessRole \
    --region   us-east-1 \
    --profile  racer2


