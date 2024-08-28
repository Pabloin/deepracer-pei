# deepracer-pei

------------------------------------------------------
LunaCar-06-racer2

   - Objetvio ... replicar en DRFC la misma configuración de LunaCar-06 que es con el que competi ...

Del log de la consola:
LunaCar-06
Writing training job pid to /opt/ml/training_worker.pid: 46
Training Worker Args: Namespace(aws_region='us-east-1', checkpoint_dir='./checkpoint_sagemaker', environment_s3_key=None, framework='tensorflow', model_metadata_s3_key='s3://aws-deepracer-data-us-east-1-1/data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/model_metadata.json', preset_s3_key=None, pretrained_checkpoint_dir='./pretrained_checkpoint_sagemaker', pretrained_s3_bucket=None, pretrained_s3_prefix='sagemaker', s3_bucket='aws-deepracer-data-us-east-1-1', s3_prefix='data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sagemaker-robomaker-artifacts/')
[s3] Successfully downloaded model metadata                  from s3 key data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/model_metadata.json to local ./custom_files/agent/model_metadata.json.



Sensor list ['FRONT_FACING_CAMERA'], network DEEP_CONVOLUTIONAL_NETWORK_SHALLOW, simapp_version 5.0, training_algorithm clipped_ppo, action_space_type discrete lidar_config {'num_sectors': 8, 'num_values_per_sector': 8, 'clipping_dist': 2.0}


Action space from file: [{'steering_angle': -30.0, 'speed': 1.0, 'index': 0}, {'steering_angle': -30.0, 'speed': 1.2, 'index': 1}, {'steering_angle': -30.0, 'speed': 1.4, 'index': 2}, {'steering_angle': -20.0, 'speed': 1.2, 'index': 3}, {'steering_angle': -20.0, 'speed': 1.5, 'index': 4}, {'steering_angle': -20.0, 'speed': 1.7, 'index': 5}, {'steering_angle': -10.0, 'speed': 1.6, 'index': 6}, {'steering_angle': -10.0, 'speed': 1.9, 'index': 7}, {'steering_angle': -10.0, 'speed': 2.2, 'index': 8}, {'steering_angle': 0.0, 'speed': 2.2, 'index': 9}, {'steering_angle': 0.0, 'speed': 2.5, 'index': 10}, {'steering_angle': 0.0, 'speed': 2.9, 'index': 11}, {'steering_angle': 10.0, 'speed': 1.6, 'index': 12}, {'steering_angle': 10.0, 'speed': 1.9, 'index': 13}, {'steering_angle': 10.0, 'speed': 2.2, 'index': 14}, {'steering_angle': 20.0, 'speed': 1.2, 'index': 15}, {'steering_angle': 20.0, 'speed': 1.5, 'index': 16}, {'steering_angle': 20.0, 'speed': 1.7, 'index': 17}, {'steering_angle': 30.0, 'speed': 1.0, 'index': 18}, {'steering_angle': 30.0, 'speed': 1.2, 'index': 19}, {'steering_angle': 30.0, 'speed': 1.4, 'index': 20}, {'steering_angle': 20.0, 'speed': 2.0, 'index': 21}, {'steering_angle': -20.0, 'speed': 2.0, 'index': 22}, {'steering_angle': -10.0, 'speed': 2.5, 'index': 23}, {'steering_angle': -10.0, 'speed': 2.8, 'index': 24}, {'steering_angle': 10.0, 'speed': 2.5, 'index': 25}, {'steering_angle': 10.0, 'speed': 2.8, 'index': 26}, {'steering_angle': 0.0, 'speed': 3.2, 'index': 27}, {'steering_angle': 0.0, 'speed': 3.6, 'index': 28}, {'steering_angle': 0.0, 'speed': 4.0, 'index': 29}]

Using the following hyper-parameters
{
  "batch_size": 64,
  "beta_entropy": 0.01,
  "discount_factor": 0.99,
  "e_greedy_value": 1.0,
  "epsilon_steps": 10000,
  "exploration_type": "categorical",
  "loss_type": "huber",
  "lr": 0.0003,
  "num_episodes_between_training": 20,
  "num_epochs": 10,
  "stack_size": 1,
  "term_cond_avg_score": 100000.0,
  "term_cond_max_episodes": 100000
}


[s3] Successfully uploaded hyperparameters to                  s3 bucket aws-deepracer-data-us-east-1-1 with s3 key data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sagemaker-robomaker-artifacts/ip/hyperparameters.json.
Hostname: ip-10-0-62-60.ec2.internal

[s3] Successfully uploaded ip address to                  s3 bucket aws-deepracer-data-us-east-1-1 with s3 key data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sagemaker-robomaker-artifacts/ip/ip.json.

[s3] Successfully uploaded ip done to                  s3 bucket aws-deepracer-data-us-east-1-1 with s3 key data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sagemaker-robomaker-artifacts/ip/done.
## Creating graph - name: MultiAgentGraphManager
## Start physics before creating graph
## Create graph
## Creating agent - name: agent
[RL] Created agent loggers


---------------------------

Robomaker log:

Updating world name based on track direction YAML parameter: arctic_open_ccw
{'AWS_REGION': 'us-east-1', 'ROBOMAKER_SIMULATION_JOB_ACCOUNT_ID': '372026249783', 'JOB_TYPE': 'TRAINING', 'WORLD_NAME': 'arctic_open_ccw', 'TRACK_DIRECTION_CLOCKWISE': 'false', 'CHANGE_START_POSITION': True, 'ALTERNATE_DRIVING_DIRECTION': False, 'TRAINING_JOB_ARN': 'arn:aws:deepracer:us-east-1:874470380781:training_job/fDmJ8bOuSwS6EkNzIJPXhw', 'METRIC_NAME': 'TrainingRewardScore', 'METRIC_NAMESPACE': 'AWSDeepRacer', 'SAGEMAKER_SHARED_S3_BUCKET': ['aws-deepracer-data-us-east-1-1'], 'SAGEMAKER_SHARED_S3_PREFIX': ['data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sagemaker-robomaker-artifacts/'], 'REWARD_FILE_S3_KEY': 'data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/reward_function.py', 'MODEL_METADATA_FILE_S3_KEY': ['data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/model_metadata.json'], 'METRICS_S3_BUCKET': ['aws-deepracer-data-us-east-1-1'], 'METRICS_S3_OBJECT_KEY': ['data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/metrics/training/training-20240814132050-fDmJ8bOuSwS6EkNzIJPXhw.json'], 'MP4_S3_BUCKET': 'aws-deepracer-data-us-east-1-1', 'MP4_S3_OBJECT_PREFIX': 'data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/videos/training/training-20240814132050-fDmJ8bOuSwS6EkNzIJPXhw/', 'SIMTRACE_S3_BUCKET': 'aws-deepracer-data-us-east-1-1', 'SIMTRACE_S3_PREFIX': 'data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/7875ba01-7f37-4552-97bd-56101d3b4937/sim-trace/training/', 'S3_KMS_CMK_ARN': 'arn:aws:kms:us-east-1:372026249783:key/158d4bf2-4f41-47cd-8d94-3b525a08691b', 'KINESIS_VIDEO_STREAM_NAME': 'dr-kvs-372026249783-20240814132049-39482789-54e5-425a-93f5-4539944771be', 'VIDEO_JOB_TYPE': 'TRAINING', 'MODEL_NAME': 'CLLTTI-CAR-01', 'RACER_NAME': 'ULAB-Abban', 'BODY_SHELL_TYPE': ['deepracer'], 'RACE_TYPE': 'TIME_TRIAL', 'CAR_COLOR': ['Black']}
[s3] Successfully downloaded model metadata                  from s3 key data-f6630d58-3b43-43ec-bd80-72cd505b7fb5/models/



_--------------------------------


[{'steering_angle': -30.0, 'speed': 1.0, 'index': 0}, {'steering_angle': -30.0, 'speed': 1.2, 'index': 1}, {'steering_angle': -30.0, 'speed': 1.4, 'index': 2}, {'steering_angle': -20.0, 'speed': 1.2, 'index': 3}, {'steering_angle': -20.0, 'speed': 1.5, 'index': 4}, {'steering_angle': -20.0, 'speed': 1.7, 'index': 5}, {'steering_angle': -10.0, 'speed': 1.6, 'index': 6}, {'steering_angle': -10.0, 'speed': 1.9, 'index': 7}, {'steering_angle': -10.0, 'speed': 2.2, 'index': 8}, {'steering_angle': 0.0, 'speed': 2.2, 'index': 9}, {'steering_angle': 0.0, 'speed': 2.5, 'index': 10}, {'steering_angle': 0.0, 'speed': 2.9, 'index': 11}, {'steering_angle': 10.0, 'speed': 1.6, 'index': 12}, {'steering_angle': 10.0, 'speed': 1.9, 'index': 13}, {'steering_angle': 10.0, 'speed': 2.2, 'index': 14}, {'steering_angle': 20.0, 'speed': 1.2, 'index': 15}, {'steering_angle': 20.0, 'speed': 1.5, 'index': 16}, {'steering_angle': 20.0, 'speed': 1.7, 'index': 17}, {'steering_angle': 30.0, 'speed': 1.0, 'index': 18}, {'steering_angle': 30.0, 'speed': 1.2, 'index': 19}, {'steering_angle': 30.0, 'speed': 1.4, 'index': 20}, {'steering_angle': 20.0, 'speed': 2.0, 'index': 21}, {'steering_angle': -20.0, 'speed': 2.0, 'index': 22}, {'steering_angle': -10.0, 'speed': 2.5, 'index': 23}, {'steering_angle': -10.0, 'speed': 2.8, 'index': 24}, {'steering_angle': 10.0, 'speed': 2.5, 'index': 25}, {'steering_angle': 10.0, 'speed': 2.8, 'index': 26}, {'steering_angle': 0.0, 'speed': 3.2, 'index': 27}, {'steering_angle': 0.0, 'speed': 3.6, 'index': 28}, {'steering_angle': 0.0, 'speed': 4.0, 'index': 29}]



-------------
Minio:

   - http://54.94.27.120:9001/login
   - http://15.228.89.75:8888/lab
   - http://127.0.0.1:8888/lab?token=d006ae7f02995151450407fa68fd5f865149473335d1c5aa
   - http://15.228.89.75:8080/
   - http://15.228.89.75:8100/?robo=all&camera=kvs_stream&quality=75&width=480


-----------------------
JuniperLab

PREFIX='model-name'   # Name of the model, without trailing '/'
BUCKET='bucket'       # Bucket name is default 'bucket' when training locally
PROFILE=None          # The credentials profile in .aws - 'minio' for local training
S3_ENDPOINT_URL=None  # Endpoint URL: None for AWS S3, 'http://minio:9000' for local training



PREFIX='T2024-08/DR-Qualifier/LunaCar-06-racer2'
BUCKET='dr-models-racer2-dots-to-pabloedu-gmail'
S3_ENDPOINT_URL='http://minio:9000'


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



10    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_fase_wip1.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_test.sh



#--------------------

# INITIAL - Training de 1.30 horas - ( 90 minutos) - 21:10 a 22:40      en GMT -3 -- 00:10
# WIP_1   - Training de 3.00 horas - (180 minutos) - 21:10 a 00:10 (+1) en GMT -3 -- 03:15 7/3
# WIP_2   - Training de 4.50 horas - (270 minutos) - 21:10 a 01:40 (+1) en GMT -3 -- 04:40 7/3
# CIERRE  - Training de 6.00 horas - (360 minutos) - 21:10 a 03:10 (+1) en GMT -3 -- 06:10 7/3

-----------------------------
crontab -e 

15    3  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_fase_wip1.sh
45    4  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_fase_wip2.sh
15    6  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_fase_cierre.sh

30,33 2  7 3 *  ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Qualifier/.config_LunaCar-06-racer2/cron_files/cron_test.sh


