# deepracer-pei

------------------------------------------------------
Experimento siguiendo a Pg3-0300

   - Va a ser el modelo de los dos waypoints futuros ... no se donde estaba --- 

-------------

   Pg3-0300

      la primera vuelta (6 hs) no estvuo mal ... 
      rápido y 1 m .15 segundos ... 
-------------

   - voy a continuar el training

      https://finlaymacrae.medium.com/easy-start-guide-for-deepracer-on-cloud-in-aws-4206db2ac6d0

      If you want to resume training the easiest way to start a new session is the dr-increment-training command. If you run this while training is stopped it increments your model name and update your run.env file to select your old model as the pre-trained one to build on.

         ubuntu@ip-172-31-22-48:~/deepracer-pei/deepracer-for-cloud$ dr-increment-training
         Configuration file /home/ubuntu/deepracer-pei/deepracer-for-cloud/run.env will be updated.
         Incrementing model from DR-Qualifier/Pg3-0300 to DR-Qualifier/Pg3-301
         Are you sure? [y/N]

            dr-increment-training  
            dr-increment-upload-model  

            dr-download-custom-files   
            dr-local-aws           

            dr-start-tournament        
            dr-stop-evaluation         
         
            dr-download-model          
            dr-get-robomaker-stats     
            
            dr-start-evaluation        
            
            dr-list-aws-models         
            
            dr-update-viewer
            dr-view-stream


----------------
Duda 

   ... cómo detecto el "last checkpoint..." o los disponibles ... ? 


Duda: 

   ¿Para que siver "evaluation"?

   ubuntu@ip-172-31-2-228:~$ dr-list-aws-models                                                                                                                Due to changes in AWS DeepRacer Console this command is no longer available.                                                                                ubuntu@ip-172-31-2-228:~$ dr-start-evaluation                                                                                                               Creating Robomaker configuration in s3://bucket-models-2024-03/DR-Qualifier/Pg3-0300k/evaluation_params.yaml                                                Creating service deepracer-eval-0_rl_coach
Creating service deepracer-eval-0_robomaker
Waiting up to 15 seconds for Robomaker #1 to start up...
09/03/2024 12:31:07 passing arg to libvncserver: -rfbport
09/03/2024 12:31:07 passing arg to libvncserver: 5900
09/03/2024 12:31:07 x11vnc version: 0.9.13 lastmod: 2011-08-10  pid: 74
09/03/2024 12:31:07
09/03/2024 12:31:07 wait_for_client: WAIT:0
09/03/2024 12:31:07
09/03/2024 12:31:07 initialize_screen: fb_depth/fb_bpp/fb_Bpl 24/32/2560
09/03/2024 12:31:07
09/03/2024 12:31:07 Listening for VNC connections on TCP port 5900
09/03/2024 12:31:07 Listening for VNC connections on TCP6 port 5900
09/03/2024 12:31:07 listen6: bind: Address already in use
09/03/2024 12:31:07 Not listening on IPv6 interface.
09/03/2024 12:31:07
                                                                                                                                                            The VNC desktop is:      e7618870370c:0
PORT=5900
JWM: warning: /etc/jwm/system.jwmrc[6]: invalid include: /etc/jwm/debian-menu
IP: 10.0.0.34 172.18.0.12 10.0.1.42  (e7618870370c)
[  
----------------
Pg3-0300k

   En este voy a ver el param de GPU plano ... 


   basado en:
   https://blog.gofynd.com/how-we-broke-into-the-top-1-of-the-aws-deepracer-virtual-circuit-c39a241979f5

   En como utilizar GPU también en Robomaker
   En especial con:

   Sugiere
   DR_CLOUD=aws
   DR_AWS_APP_REGION=us-east-1
   DR_UPLOAD_S3_BUCKET=my-transit-bucket
   DR_LOCAL_S3_PROFILE=default

   DR_SAGEMAKER_IMAGE=gpu
   DR_ROBOMAKER_IMAGE=2.0.11-gpu

   Tengo
   DR_SAGEMAKER_IMAGE=5.1.1-gpu
   DR_ROBOMAKER_IMAGE=5.1.2-cpu-avx2
   DR_ANALYSIS_IMAGE=cpu
   DR_COACH_IMAGE=5.1.2


   Dejo a:
   DR_ROBOMAKER_IMAGE=5.1.2-gpu

   docker pull awsdeepracercommunity/deepracer-robomaker:5.1.2-gpu


---------------------------------
TODO: 
Para Seguir ... 
   https://blog.gofynd.com/how-we-broke-into-the-top-1-of-the-aws-deepracer-virtual-circuit-573ba46c275

   https://towardsdatascience.com/an-advanced-guide-to-aws-deepracer-2b462c37eea






---------------------------------

Pg3-0300q

      
      -start-training 
      21:M 10 Mar 2024 20:01:32.684 

      24 22 10 03 *  source /..../.config_Pg3-0300/cron_files/cron_fases.sh Initial_150
      46 23 10 03 *  source /..../.config_Pg3-0300/cron_files/cron_fases.sh Fase_230
      06 01 11 03 *  source /..../.config_Pg3-0300/cron_files/cron_fases.sh Fase_320
      46 02 11 03 *  source /..../.config_Pg3-0300/cron_files/cron_fases.sh Close_420


      Objetivo 1:

         Que el modelo base vuelva a llegar a los 0.57 segundos que había logrado antes ...
         Con dos entrenamientos ...
            - El de 5 horas 
            - El de otras 5 horas .. en una instancia de 16x pero que después no la pude continuar ... 
            Entonces estoy empezando de nuevo .. 

      Duda.. ¿Cómo podría evaluar los checkpoints ... ? Con una juiper me dice cual checkpoint es el mejor ... ?
      Podría hacer el training también ?

         dr-start-evaluation que hace ?? 

_____________________________________________________________________

Nota:

   ¿Podría evaluar ... ?

   De acuerdo a:
      https://github.com/aws-deepracer-community/deepracer-for-cloud/blob/master/docs/video.md
      Saving Evaluation to File
During evaluation (dr-start-evaluation), if DR_EVAL_SAVE_MP4=True then three MP4 files are created in the S3 bucket's MP4 folder. They contain the in-car camera, top-camera and the camera following the car.

   En el siguiente:
      https://awstip.com/deepracer-for-cloud-drfc-configuration-4a785494423c

      Usan al mismo valor ... 

      DR_EVAL_OPP_S3_MODEL_PREFIX=rl-deepracer-sagemaker
         DR_LOCAL_S3_MODEL_PREFIX=rl-deepracer-sagemaker

_____________________________________________________________________
Nota:

   En, dice:
   https://awstip.com/deepracer-for-cloud-drfc-configuration-4a785494423c

   DR_TRAIN_MIN_EVAL_TRIALS : Minimum number of evaluations to perform after every iteration. Setting it to a minimum number (1 or 2) during initial training should reduce the training time to some extent. Best checkpoint is determined based on the performance of the model during evaluation between iterations. So, if you plan to use best checkpoint for racing instead of last checkpoint, once the model starts exploiting the environment, its better to increase this value to 5 atleast.

      Y yo lo tengo en 5 ... 

      ubuntu@ip-172-31-16-150:~/deepracer-pei/deepracer-for-cloud$ env | grep DR_TRAIN_MIN_EVAL_TRIALS
      DR_TRAIN_MIN_EVAL_TRIALS=5

      Igual ... podría mandarlo a 7 ... no se si impacta porque no esta mas .. 


   sample run.env

      DR_TRAIN_MIN_EVAL_TRIALS=5
      DR_TRAIN_MIN_EVAL_TRIALS=7



mc: <ERROR> Failed to copy `http://127.0.0.1:9000/bucket-models-2024-03/DR-Qualifier/Pg3-0300q/model/67_Step-179964.ckpt.data-00000-of-00001`. write /home/ubuntu/MINIO_SYNC/DR-Qualifier/Pg3-0300q/model/67_Step-179964.ckpt.data-00000-of-00001.part.minio: no space left on device                                   mc: <ERROR> Failed to copy `http://127.0.0.1:9000/bucket-models-2024-03/DR-Qualifier/Pg3-0300q/model/model_66.pb`. write /home/ubuntu/MINIO_SYNC/DR-Qualifier/Pg3-0300q/model/model_66.pb.part.minio: no space left on device
mc: <ERROR> Failed to copy `http://127.0.0.1:9000/bucket-models-2024-03/DR-Qualifier/Pg3-0300q/model/model_67.pb`. write /home/ubuntu/MINIO_SYNC/DR-Qualifier/Pg3-0300q/model/model_67.pb.part.minio: no space left on device


mc: <ERROR> Failed to copy `http://127.0.0.1:9000/bucket-models-2024-03/DR-Qualifier/Pg3-0300q/model/66_Step-175974.ckpt.data-00000-of-00001`. write /home/ubuntu/MINIO_SYNC/DR-Qualifier/Pg3-0300q/model/66_Step-175974.ckpt.data-00000-of-00001.part.minio: no space left on device         



https://github.com/minio/minio/issues/12872


   ext4

   Yeah, you have run out of the number of directories per prefix - ext4 has 64k limitation - 
   you should re-format the drives to use XFS.

ubuntu@ip-172-31-16-150:~/MINIO_SYNC/DR-Qualifier$ df -H
Filesystem       Size  Used Avail Use% Mounted on
/dev/root         63G   63G   51M 100% /
tmpfs             67G   91k   67G   1% /dev/shm
tmpfs             27G  2.6M   27G   1% /run
tmpfs            5.3M     0  5.3M   0% /run/lock
/dev/nvme0n1p15  110M  6.4M  104M   6% /boot/efi
tmpfs             14G   33k   14G   1% /run/user/1000


Cuando seteo al disco por primera vez: (tiene solo 12 gb ... )

ubuntu@ip-172-31-19-30:~$  df -H --output=source,size,used,avail
Filesystem       Size  Used Avail
/dev/root         63G   51G   12G
tmpfs             67G     0   67G
tmpfs             27G  1.3M   27G
tmpfs            5.3M     0  5.3M
/dev/nvme0n1p15  110M  6.4M  104M
tmpfs             14G   33k   14G



#---------------------------------
Checkpoints ...


"66_Step-175974.ckpt
66_Step-175974.ckpt.data-00000-of-00001

64_Step-170203.ckpt.data-00000-of-00001
65_Step-172301.ckpt.data-00000-of-00001


ubuntu@ip-172-31-19-94:~/deepracer-pei/deepracer-for-cloud$ mc ls myminio/bucket-models-2024-03/DR-Qualifier/Pg3-0300q/model
[2024-03-11 01:42:39 UTC]    19B STANDARD .coach_checkpoint
[2024-03-11 01:40:54 UTC]     0B STANDARD .ready
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 39_Step-84882.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 39_Step-84882.ckpt.index
[2024-03-11 01:40:54 UTC] 1.0MiB STANDARD 39_Step-84882.ckpt.meta
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 43_Step-97782.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 43_Step-97782.ckpt.index
[2024-03-11 01:40:54 UTC] 1.0MiB STANDARD 43_Step-97782.ckpt.meta
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 44_Step-101084.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 44_Step-101084.ckpt.index
[2024-03-11 01:40:55 UTC] 1.0MiB STANDARD 44_Step-101084.ckpt.meta
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 45_Step-103379.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 45_Step-103379.ckpt.index
[2024-03-11 01:40:56 UTC] 1.0MiB STANDARD 45_Step-103379.ckpt.meta
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 64_Step-170203.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 64_Step-170203.ckpt.index
[2024-03-11 01:40:56 UTC] 1.0MiB STANDARD 64_Step-170203.ckpt.meta
[2024-03-11 01:41:04 UTC]  45MiB STANDARD 65_Step-172301.ckpt.data-00000-of-00001
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 65_Step-172301.ckpt.index
[2024-03-11 01:40:56 UTC] 1.0MiB STANDARD 65_Step-172301.ckpt.meta
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 66_Step-175974.ckpt.index
[2024-03-11 01:40:57 UTC] 1.0MiB STANDARD 66_Step-175974.ckpt.meta
[2024-03-11 01:40:54 UTC] 1.1KiB STANDARD 67_Step-179964.ckpt.index
[2024-03-11 01:40:57 UTC] 1.0MiB STANDARD 67_Step-179964.ckpt.meta
[2024-03-11 01:40:54 UTC]   228B STANDARD deepracer_checkpoints.json
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_39.pb
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_43.pb
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_44.pb
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_45.pb
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_64.pb
[2024-03-11 01:41:04 UTC]  22MiB STANDARD model_65.pb
[2024-03-11 01:40:54 UTC] 1.6KiB STANDARD model_metadata.json


         .data-00000-of-00001
         .data-00000-of-00001

         64_Step-170203.ckpt
         65_Step-172301.ckpt


         {"best_checkpoint": {"name": "64_Step-170203.ckpt", "avg_eval_metric": 58.877565467224805, "time_stamp": 5502.2}, "last_checkpoint": {"name": "65_Step-172301.ckpt", "avg_eval_metric": 18.923731951573835, "time_stamp": 5734.297}}


------------------
El modelo r:

   Pg3-0300r

         20:C 11 Mar 2024 02:23:40.368 
                          23:23   en GMt-3

-----------------------

SOBRE COMO ENTENDER Y ANALIZAR LOS LOGS ... 

Esto es también del modelo Pg3-0100

https://steemit.com/programming/@codelikeamother/analyzing-the-aws-deepracer-logs-my-way



-----------------------






