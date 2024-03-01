from minio import Minio

client = Minio("http://127.0.0.1:9000",
    access_key="Minio_USER",
    secret_key="Minio_PASS",
)

client_prod = Minio("http://http://34.207.199.63/:9000",
    access_key="Minio_USER",
    secret_key="Minio_PASS",
)





mc admin info local
mc ls local

# Simil a DrDwon ... 
# spDown
mc cp local/bucket/rl-deepracer-sagemaker  RACER_PEZE/ --recursive

mc cp local/bucket/Spot-Tracks/DE10      ~/MINIO_SYNC/Spot-Tracks   --recursive

# Simil spUp

# Simip spImport

mc cp local/bucket/   ee --recursive
mc cp myminio/bucket/ ee --recursive

mc cp myminio/bucket-models-2024-01/Spot-Tracks/LUZ-01bis1      ~/MINIO_SYNC/Spot-Tracks   --recursive

s3://aws-deepracer-logs-varios/Hola Pablo Eze gmail.txt


mc alias set local/     http://127.0.0.1:9000  Minio_USER  Minio_PASS
mc alias set myminio/   http://127.0.0.1:9000  Minio_USER  Minio_PASS

    
    Nota: Parece que tienen que ser reales las claves para el profile de Minio
           al menos para el config ... quiza despues de pueda rotar y no 
           perder el acceso ... 


        Minio try default credentials :

            user: minioadmin
            PWD: minioadmin

mc alias set s3deepracer/  https://s3.amazonaws.com  USER_ACC_KEY PASS_ACC_KEY
mc alias remove s3deepracer/


#
mc ls myminio
mc mb myminio/bucket-models-2024-01

mc mb myminio/bucket-models-2024-03
mc mb myminio/bucket-models-2024-04
mc mb myminio/bucket-models-2024-05
mc mb myminio/bucket-models-2024-06
mc mb myminio/bucket-models-2024-07
mc mb myminio/bucket-models-2024-08
mc mb myminio/bucket-models-2024-09
mc mb myminio/bucket-models-2024-10


mc mb local/bucketaaaa

mc rm -r local/bucketaaaa  --force --dangerous

mc rm -r local/bucketaaaa  --force


mc admin service restart myminio

# -----------------
 # Nota: ...
    # Capaz para subir a Minio lo puedo copiar directo en el folder de data ...
    #     y para bajar capaz que también .. y no tengo que utilizar el otro dir de download...   
    # ~/deepracer-pei/deepracer-for-cloud/data/minio/bucket-models-2024-01/Spot-Tracks


# ----------------
Config en DRFC

    ${DR_DIR}
    ./docs/_config.yml
    ./data/minio/.minio.sys/config
    ./data/minio/.minio.sys/config/config.json



