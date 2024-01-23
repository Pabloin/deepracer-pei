# deepracer-pei
Empiezo con DOTS

-------------------------
Este es un backup - config de 
prueba de ejecucion local con Minio ...

    - Todavía no es muy exitoso....
    - creo que lo voy a descartar y probar 
        - EC2 pero sin GPU para abaratar 
            costos de pruebas como hacia antes ... 
            
-------------------------

Por ejecutar:

    init.sh -c local -a cpu

---------------------------------

Aparecio:
    -  custom_files/
    -  run.env
    -  system.env

---------------------------------

DICE:

In Local mode the script-set requires the following:

Configure the Minio credentials with aws configure --profile minio. The default configuration will use the minio profile to configure MINIO. You can choose any username or password, but username needs to be at least length 3, and password at least length 8.
A real AWS IAM user configured with aws configure to enable upload of models into AWS DeepRacer.
Configure system.env as follows:
    DR_LOCAL_S3_PROFILE=default
    DR_LOCAL_S3_BUCKET=<bucketname>
    DR_UPLOAD_S3_PROFILE=default
    DR_UPLOAD_S3_BUCKET=<your-aws-deepracer-bucket>
Run dr-update for configuration to take effect.


TENGO:

    DR_UPLOAD_S3_BUCKET=not-defined
    DR_UPLOAD_S3_ROLE=to-be-defined
    DR_LOCAL_S3_BUCKET=bucket
    DR_LOCAL_S3_PROFILE=minio

EXISTE:

    aws s3 ls --profile pabloedu-gmail-UCEMA  \
              s3://dr-models-glaciar-dots-to-pabloedu-gmail/Ulab-Tracks/  

        PRE custom_files/
        PRE ulab-demet-01/
        PRE ulab-demet-10/
        PRE ulab-demet-11-CLON1/
        PRE ulab-demet-11-CLON2/
        PRE ulab-demet-11/

CONFIGURO:

    DR_UPLOAD_S3_BUCKET=dr-models-glaciar-dots-to-pabloedu-gmail/DOTS-Local/
    DR_UPLOAD_S3_ROLE=arn:aws:iam::307424703238:role/LabRole
    DR_LOCAL_S3_BUCKET=dr-models-glaciar-dots-to-pabloedu-gmail/DOTS-Local/
    DR_LOCAL_S3_PROFILE=pabloedu-gmail-UCEMA

    
  #  DR_LOCAL_S3_BUCKET=dr-models-glaciar-dots-to-pabloedu-gmail
    


    arn:aws:iam::307424703238:role/LabRole
    arn:aws:iam::307424703238:instance-profile/LabInstanceProfile