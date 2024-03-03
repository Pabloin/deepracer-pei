#!/usr/bin/env bash

MY_HOME_DRFC=~/deepracer-pei/deepracer-for-cloud

ls -la   ${MY_HOME_DRFC}/custom_files
rm -r    ${MY_HOME_DRFC}/custom_files

mkdir -p ${MY_HOME_DRFC}/custom_files

## De esta config
cp   ./custom_files/reward_function.py          ${MY_HOME_DRFC}/custom_files/reward_function.py
cp   ./custom_files/model_metadata_v101a.json   ${MY_HOME_DRFC}/custom_files/model_metadata.json
cp   ./custom_files/hyperparameters_v101a.json  ${MY_HOME_DRFC}/custom_files/hyperparameters.json

cp   ./run_v101a.env    ${MY_HOME_DRFC}/run.env
cp   ./system.env       ${MY_HOME_DRFC}/system.env


ls   -la   ${MY_HOME_DRFC}/custom_files
ls   -la   ${MY_HOME_DRFC}/run.env
ls   -la   ${MY_HOME_DRFC}/system.env



#-----------------------------

export MY_HOME_DRFC=~/deepracer-pei/deepracer-for-cloud

function ee3() {
    grep  ^DR_ ${MY_HOME_DRFC}/$1 | grep $2
}

echo -e "\n---- [ run.env ] ---\n"

ee3 run.env  DR_WORLD_NAME=
ee3 run.env  DR_LOCAL_S3_MODEL_PREFIX=
ee3 run.env  DR_LOCAL_S3_PRETRAINED=
ee3 run.env  DR_LOCAL_S3_PRETRAINED_PREFIX=
ee3 run.env  DR_LOCAL_S3_PRETRAINED_CHECKPOINT=

echo -e "\n---- [ system.env ] ---\n"

ee3 system.env DR_UPLOAD_S3_BUCKET=
ee3 system.env DR_UPLOAD_S3_ROLE=
ee3 system.env DR_LOCAL_S3_BUCKET=
ee3 system.env DR_LOCAL_S3_PROFILE=

ee3 system.env DR_WORKERS=


