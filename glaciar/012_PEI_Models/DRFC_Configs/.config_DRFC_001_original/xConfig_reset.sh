#!/usr/bin/env bash

MY_HOME_DRFC=~/deepracer-pei/deepracer-for-cloud

ls -la   ${MY_HOME_DRFC}/custom_files
rm -r    ${MY_HOME_DRFC}/custom_files

mkdir -p ${MY_HOME_DRFC}/custom_files

## De esta config
cp   ./custom_files/reward_function.py      ${MY_HOME_DRFC}/custom_files/reward_function.py
cp   ./custom_files/model_metadata.json     ${MY_HOME_DRFC}/custom_files/model_metadata.json
cp   ./custom_files/hyperparameters.json    ${MY_HOME_DRFC}/custom_files/hyperparameters.json

cp   ./run.env       ${MY_HOME_DRFC}/run.env
cp   ./system.env    ${MY_HOME_DRFC}/system.env


ls   -la   ${MY_HOME_DRFC}/custom_files
ls   -la   ${MY_HOME_DRFC}/run.env
ls   -la   ${MY_HOME_DRFC}/system.env


echo "\n ---- [ run.env ] ---"
head -25   ${MY_HOME_DRFC}/run.env 

echo "\n ---- [ system.env ] ---"
head -15   ${MY_HOME_DRFC}/system.env   






~/deepracer-pei/deepracer-for-cloud 

~/deepracer-pei/glaciar/012_PEI_Models/DRFC_Configs/.config_DRFC_001_original

-------------
cd ~/deepracer-pei/glaciar/012_PEI_Models/DRFC_Configs/.config_DRFC_001_original

cp -r ~/deepracer-pei/deepracer-for-cloud/custom_files/* ./custom_files/ 
cp    ~/deepracer-pei/deepracer-for-cloud/run.env  . 
cp    ~/deepracer-pei/deepracer-for-cloud/system.env  .