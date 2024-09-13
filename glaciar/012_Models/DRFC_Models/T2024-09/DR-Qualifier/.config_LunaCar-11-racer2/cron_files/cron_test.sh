#!/bin/bash

# 23:33 (GMT -3) 
# 02:33 (GMT  0)
# d25h0249

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)
MY_NAME=$(date +d%dh%H%M)

MODEL_NOMBRE=LunaCar-11-racer2-${MY_NAME}

echo "${MY_TIME} Hola Pablo ${MODEL_NOMBRE}" >> ~/logs.crontab

# 40,50 2 7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-04/DR-Qualifier/.config_LunaCar-11-racer2/cron_files/cron_test.sh


