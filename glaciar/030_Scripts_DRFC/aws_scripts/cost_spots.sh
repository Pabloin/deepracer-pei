#!/bin/bash


## Script para saber en que region la instancia SPOT XX está mas barata ... 

function getSpotPrice_xRegion() {

     aws ec2 describe-spot-price-history    \
          --instance-types ${MY_SPOT}      \
          --product-descriptions "Linux/UNIX"  \
          --start-time ${MY_DESDE}   \
          --end-time   ${MY_HASTA}    \
          --output text  \
          --region ${MY_REGION}
   
}

function getPrecio_xRegiones() {

     MY_REGIONS=("${@}")
     echo ${MY_REGIONS[@]}

     for region in "${MY_REGIONS[@]}"; do

          echo "---[Region ${region} ] ----------"
          MY_REGION=${region}
          getSpotPrice_xRegion

     done
   
}

# Ejemplo
# MY_DESDE=2024-02-09T01:00:09
# MY_HASTA=2024-02-10T23:59:00

# 1 hora
MY_DESDE=$(date +%Y-%m-%dT%H:%M:%S --date='-1 hour')
MY_HASTA=$(date +%Y-%m-%dT%H:%M:%S)



#---------------------
MY_SPOT=g4dn.2xlarge
# MY_SPOT=g4dn.4xlarge
# MY_SPOT=g5.2xlarge
# MY_SPOT=g5.4xlarge



REGIONS_CON_GPU_ENUSO=("eu-north-1" "us-east-1")
REGIONS_CON_GPU_TENGO=("eu-north-1" "us-east-1"  "us-west-2" "af-south-1"  )
REGIONS_CON_GPU_CHEAP=("eu-south-1" "eu-north-1" "sa-east-1" "ap-northeast-3" "me-south-1" )

# REGIONS_CON_GPU_ENUSO
# - US East (N. Virginia)	us-east-1
# - Europe (Stockholm)	     eu-north-1

# REGIONS_CON_GPU_TENGO
# - US East (N. Virginia)	us-east-1
# - US West (Oregon)	     us-west-2
# - Africa (Cape Town)	     af-south-1
# - Europe (Stockholm)	     eu-north-1

# REGIONS_CON_GPU_CHEAP
# - Europe (Milan)         	eu-south-1
# - Europe (Stockholm)	     eu-north-1
# - South America (São Paulo)	sa-east-1
# - Asia Pacific (Osaka)	     ap-northeast-3
# - Middle East (Bahrain)	me-south-1

echo "SPOT ${MY_SPOT}"
echo " "
echo "REGIONS CON GPU ENUSO"
getPrecio_xRegiones  ${REGIONS_CON_GPU_ENUSO[@]}

echo " "
echo "REGIONS CON GPU TEMGO"
getPrecio_xRegiones  ${REGIONS_CON_GPU_TENGO[@]}

echo " "
echo "REGIONS CON GPU CHEAP"
getPrecio_xRegiones  ${REGIONS_CON_GPU_CHEAP[@]}


echo "BEST g4dn.2xlarge - "
echo "BEST g4  .2xlarge - "

echo "BEST g5.2xlarge   - 0.206' (sa-east-1b)  - 0.4236 (eu-north-1b)

#  RUN
#
# g4dn.2xlarge
# g4dn.4xlarge
#
# g5  .2xlarge
# g5  .4xlarge
#  
#  Filtro g[45][^ga].*\.[24]x?large
#
#  https://instances.vantage.sh/?min_vcpus=8&filter=g[45][^ga].*\.[24]x?large&selected=g4dn.2xlarge,g4dn.4xlarge,g5.2xlarge,g5.4xlarge
#  https://instances.vantage.sh/?filter=g[45][^ga].*\.[24]x?large&region=ap-northeast-2&selected=g4dn.2xlarge,g4dn.4xlarge,g5.2xlarge,g5.4xlarge
#

#  ./cost_spots.sh > costs_g5.2xlarge

