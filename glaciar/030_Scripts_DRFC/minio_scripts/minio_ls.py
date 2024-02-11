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


# Simil spUp

# Simip spImport

mc cp local/bucket/   ee --recursive
mc cp myminio/bucket/ ee --recursive


s3://aws-deepracer-logs-varios/Hola Pablo Eze gmail.txt


mc alias set myminio/   http://127.0.0.1:9000  Minio_USER  Minio_PASS
mc alias set local/     http://127.0.0.1:9000  Minio_USER  Minio_PASS


mc alias set s3deepracer/  https://s3.amazonaws.com  USER_ACC_KEY PASS_ACC_KEY
mc alias remove s3deepracer/

