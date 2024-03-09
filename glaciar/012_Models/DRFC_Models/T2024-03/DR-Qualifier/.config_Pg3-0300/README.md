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

            dr-download-custom-files   
            dr-local-aws               
            dr-start-tournament        
            dr-update-env
            dr-download-model          
            dr-logs-loganalysis        
            dr-start-training          
            dr-update-viewer
            dr-find-robomaker          
            dr-logs-robomaker          
            dr-start-viewer            
            dr-upload-car-zip
            dr-find-sagemaker          
            dr-logs-sagemaker          
            dr-stop-evaluation         
            dr-upload-custom-files
            dr-get-robomaker-stats     
            dr-reload                  
            dr-stop-loganalysis        
            dr-upload-model
            dr-increment-training      
            dr-set-upload-model        
            dr-stop-training           
            dr-url-loganalysis
            dr-increment-upload-model  dr-start-evaluation        
            dr-stop-viewer             
            dr-view-stream
            dr-list-aws-models         
            dr-start-loganalysis       
            dr-update