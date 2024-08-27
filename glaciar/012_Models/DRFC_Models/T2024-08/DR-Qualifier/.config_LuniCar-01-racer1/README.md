# deepracer-pei

------------------------------------------------------
LuniCar-01

   - En realidad sigue a LunaCar-06
      que es el que envié a competir con 16.572 ...


   - Objetivo ... 
      - Dejarlo entrenando ...
-------------
Minio:

   - http://54.94.27.120:9001/login
   - http://15.228.89.75:8888/lab
   - http://127.0.0.1:8888/lab?token=d006ae7f02995151450407fa68fd5f865149473335d1c5aa
   - http://15.228.89.75:8080/
   - http://15.228.89.75:8100/?robo=all&camera=kvs_stream&quality=75&width=480

-----------------------
SANDBOX ...

   - Para estados intermedios voy a utilizar
      - Sandbox de AWS ACADEMY UCEMA - EDUCADOR ... 
      - Perfil UCEMA
         EseProfe


-----------------------------
CAPACIDADES DE LA CONSOLA


https://bbs.archlinux.org/viewtopic.php?id=254436


   using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
   [libx264 @ 0x55f2320b4700] profile High, level 2.2
   [libx264 @ 0x55f2320b4700] 264 - core 155 r2917 0a84d98 - H.264/MPEG-4 AVC codec - Copyleft 2003


[31m[ERROR] [1723641926.024740237, 1.085000000]: [open_codec] Could not open codec[0m
[libx264 @ 0x55f2320b4700] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
[libx264 @ 0x55f2320b4700] profile High, level 2.2
[libx264 @ 0x55f2320b4700] 264 - core 155 r2917 0a84d98 - H.264/MPEG-4 AVC codec - Copyleft 2003-2018 - http://www.videolan.org/x264.html - options: cabac=1 ref=1 deblock=1:0:0 analyse=0x3:0x113 me=hex subme=2 psy=1 psy_rd=1.00:0.00 mixed_ref=0 me_range=16 chroma_me=1 trellis=0 8x8dct=1 cqm=0 deadzone=21,11 fast_pskip=1 chroma_qp_offset=0 threads=7 lookahead_threads=7 sliced_threads=1 slices=7 nr=0 decimate=1 interlaced=0 bluray_compat=0 constrained_intra=0 bframes=0 weightp=1 keyint=15 keyint_min=8 scenecut=40 intra_refresh=0 rc=abr mbtree=0 bitrate=2048 ratetol=1.0 qcomp=0.60 qpmin=0 qpmax=69 qpstep=4 ip_ratio=1.40 aq=1:1.00


-----------------------------
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



10    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_fase_wip1.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_test.sh



#--------------------

# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:15 7/3
# WIP_2   - Training de 4.50 horas - (270 minutos) - 21:10 a 01:40 (+1) en GMT -3 -- 04:40 7/3
# CIERRE  - Training de 6.00 horas - (360 minutos) - 21:10 a 03:10 (+1) en GMT -3 -- 06:10 7/3

-----------------------------
crontab -e 

15    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_fase_wip1.sh
45    4  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_fase_wip2.sh
15    6  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_fase_cierre.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LuniCar-01-racer1/cron_files/cron_test.sh


