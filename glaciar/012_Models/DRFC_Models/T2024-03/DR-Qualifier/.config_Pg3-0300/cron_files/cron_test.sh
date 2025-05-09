#!/bin/bash

# 23:33 (GMT -3) 
# 02:33 (GMT  0)

MY_TIME=$(date +%Y-%m-%dT%H:%M:%S)


echo "${MY_TIME} Hola Pablo" >> ~/logs.crontab

#--------------------
#  minute  hour  day_of_month month day_of_week command_to_run

# 10 2 8 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_test.sh

# 1 hora
MY_DATE_RUN=$(date    +%M\ %H\ %d\ %m)
MY_DATE_INIT=$(date   +%M\ %H\ %d\ %m  --date='+1 hour +30 minutes')
MY_DATE_WIP1=$(date   +%M\ %H\ %d\ %m  --date='+3 hour +0  minutes')
MY_DATE_WIP2=$(date   +%M\ %H\ %d\ %m  --date='+4 hour +30 minutes')
MY_DATE_CLOSE=$(date  +%M\ %H\ %d\ %m  --date='+6 hour +0  minutes')

# 1 hora
MY_DESDE=$(date +%Y-%m-%dT%H:%M:%S --date='-1 hour')

MY_TIME_GMT0=$(date +%Y-%m-%dT%H:%M:%S)
MY_TIME_GMT3_MENOS=$(date +%Y-%m-%dT%H:%M:%S --date='-3 hour')

cat << EOM

Start: ${MY_DATE_RUN}

# min hh dom mon dow command_to_run

${MY_DATE_INIT} *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Inicial
${MY_DATE_WIP1} *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Wip1
${MY_DATE_WIP2} *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Wip2
${MY_DATE_CLOSE} *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0300/cron_files/cron_fases.sh Close


MY_TIME_GMT  0=${MY_TIME_GMT0}
MY_TIME_GMT -3=${MY_TIME_GMT3_MENOS}
EOM



