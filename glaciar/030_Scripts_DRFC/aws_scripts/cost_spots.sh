#!/bin/bash


## Script para saber en que region la instancia SPOT XX está mas barata ... 

function getPriceSpots() {

     aws ec2 describe-spot-price-history    \
          --instance-types ${MY_SPOT}      \
          --product-descriptions "Linux/UNIX"  \
          --start-time ${MY_DESDE}   \
          --end-time   ${MY_HASTA}    \
          --output text  \
          --profile racer1 \
          --region ${MY_REGION}
   
}

MY_DESDE=2024-02-09T01:00:09
MY_HASTA=2024-02-10T23:59:00

# 1 hora
MY_DESDE=(date +"%T")
MY_HASTA=2024-02-10T23:59:00

#---------------------
MY_SPOT=g4dn.2xlarge

# Europe (Milan)	               eu-south-1
# Europe (Stockholm)	          eu-north-1
# South America (São Paulo)	sa-east-1
# Asia Pacific (Osaka)	     ap-northeast-3
# Middle East (Bahrain)	     me-south-1
# Middle East (Bahrain)	     me-south-1

MY_REGIONS=("sa-east-1" "eu-north-1" "us-east-1")

MY_SPOT=g4dn.2xlarge

for region in "${MY_REGIONS[@]}"; do

     MY_REGION=${region}
     getPriceSpots

done


