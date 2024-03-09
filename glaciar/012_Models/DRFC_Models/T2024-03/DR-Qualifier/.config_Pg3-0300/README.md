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
