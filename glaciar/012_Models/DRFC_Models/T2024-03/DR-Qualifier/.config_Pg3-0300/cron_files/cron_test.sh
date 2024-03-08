#!/bin/bash

# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)


echo "${MY_TIME} Hola Pablo" >> ~/logs.crontab

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2 8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_test.sh

# 1 hora
MY_DATE_RUN=$(date    %M %H %m %d)
MY_DATE_INIT=$(date   %M %H %m %d  --date='+1 hour +30 minutes')
MY_DATE_WIP1=$(date   %M %H %m %d  --date='+3 hour +0  minutes')
MY_DATE_WIP2=$(date   %M %H %m %d  --date='+4 hour +30 minutes')
MY_DATE_CLOSE=$(date  %M %H %m %d  --date='+6 hour +0  minutes')

cat << EOM

Start: ${MY_DATE_RUN}

${MY_DATE_INIT} * command_to_run
${MY_DATE_WIP1} * command_to_run
${MY_DATE_WIP2} * command_to_run
${MY_DATE_CLOSE} * command_to_run

EOM




