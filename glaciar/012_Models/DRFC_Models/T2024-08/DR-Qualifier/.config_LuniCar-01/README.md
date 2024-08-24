# deepracer-pei

------------------------------------------------------
LuniCar-01

   - En realidad sigue a LunaCar-06
      que es el que envié a competir con 16.572 ...


   - Objetivo ... 
      - Dejarlo entrenando ...
-------------

Arrancó a las 21:10 ...

   ¿Le puedo poner un cron?

   Por ejemplo cuando el Up and Down ...


   DUDA:
      Tengo Hard que los Steps en este modelo son 280
      ¿Eso está Ok ... ?



      1 hora 1 media despues ...

      Iteración 31 y Episodio 1900 
      
      Training> Name=main_level/agent, Worker=0, Episode=1916, Total reward=8.25, Steps=73859, Training iteration=31
      Training> Name=main_level/agent, Worker=0, Episode=1917, Total reward=7.92, Steps=73912, Training iteration=31
      Training> Name=main_level/agent, Worker=0, Episode=1918, Total reward=11.74, Steps=73982, Training iteration=31
      Training> Name=main_level/agent, Worker=0, Episode=1919, Total reward=3.86, Steps=74012, Training iteration=31
      Training> Name=main_level/agent, Worker=0, Episode=1920, Total reward=10.9, Steps=74072, Training iteration=31
      Policy training> Surrogate loss=0.008844220079481602, KL divergence=0.014815968461334705, Entropy=2.6362762451171875, training epoch=0, learning_rate=0.0003Policy training> Surrogate loss=-0.10005447268486023, KL divergence=0.05299327149987221, Entropy=2.6061813831329346, training epoch=1, learning_rate=0.0003


------------------



10    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_fase_wip1.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_test.sh



#--------------------

# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:15 7/3
# WIP_2   - Training de 4.50 horas - (270 minutos) - 21:10 a 01:40 (+1) en GMT -3 -- 04:40 7/3
# CIERRE  - Training de 6.00 horas - (360 minutos) - 21:10 a 03:10 (+1) en GMT -3 -- 06:10 7/3

-----------------------------
crontab -e 

15    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_fase_wip1.sh
45    4  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_fase_wip2.sh
15    6  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_fase_cierre.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_Pg3-0200/cron_files/cron_test.sh


