# deepracer-pei

Log Analisi dentro del docker

necesito un 

ln -s  

C:\Users\pablo\AWS DeepRacer\deepracer-pei\glaciar\012_Models\DRFC_Models\T2024-03\DR-Analysis\README.md

(o un cp ... ) (o un mount de docker)

# True to get logs mounted to `$DR_DIR/data/logs/robomaker/$DR_LOCAL_S3_MODEL_PREFIX`
DR_ROBOMAKER_MOUNT_LOGS=True


ubuntu@ip-172-31-22-48:~/deepracer-pei/deepracer-for-cloud$ find . -name *ipy*
./data/analysis/.ipynb_checkpoints
./data/analysis/.ipynb_checkpoints/Pg3-0100a-Metrics-checkpoint.ipynb
./data/analysis/Pg3-0100/Pg3-0100a-Metrics.ipynb
./data/analysis/Pg3-0100/.ipynb_checkpoints
./data/analysis/Pg3-0100/.ipynb_checkpoints/Pg3-0100-Metrics-checkpoint.ipynb
./data/analysis/Pg3-0100/Pg3-0100-Metrics.ipynb


~/deepracer-pei/deepracer-for-cloud/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis


cp -r ~/deepracer-pei/deepracer-for-cloud/data/analysis/Pg3-0100 \
      ~/deepracer-pei/glaciar/012_Models/DRFC_Models/T2024-03/DR-Analysis
