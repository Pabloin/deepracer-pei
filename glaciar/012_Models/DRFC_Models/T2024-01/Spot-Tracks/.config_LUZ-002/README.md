# deepracer-pei

Experimento siguiendo a Luz-01

-------------------------
a) Tengo al modelo de Luz "tem88-test-v001" como el mejor del track
    Test Race - Baadal Track
    AmericasGeneratedInclStart

    Se entrenó con CPU y con solo dos horas ... 
    Pero con otros modelos no pude superarlo ... 
    Preguntas:
        a) ¿Lo pudeo entrenar con DRFC ...?
        b) ¿Con qué CPU entrena la consola... ?
        c) DUDA: Estoy seguro que entrena con GPU ? Con cuantos workers ?
-------------------------
Por fin estoy con g4dn GPU

Creo que es "local" el que tengo que ejecutar (no aws) 
para que me aparezca el servicio de minio ... 

-------------------------

Por ejecutar:

    init.sh -c local -a gpu

---------------------------------
Es Luz001 ...

    - Objetivo --- mismo algoritmo pero con GPU en por ejemplo San Pablo --- 


SPOTPRICEHISTORY        
    eu-north-1c     
    g4dn.2xlarge    
    Linux/UNIX      
    0.134400

    Lo entrenamos creo que con Racer1




-----------------
Ojo que está entrenando sin CPU ... 

2024-02-16 04:11:09,677 sagemaker-containers INFO     Imported framework sagemaker_tensorflow_container.training
2024-02-16 04:11:09,686 sagemaker-containers INFO     No GPUs detected (normal if no gpus installed)
/usr/local/lib/python3.6/dist-packages/boto3/compat.py:88: PythonDeprecationWarning: Boto3 will no longer support Python 3.6 starting May 30, 2022. To conti
nue receiving service updates, bug fixes, and security updates please upgrade to Python 3.7 or later. More information can be found here: https://aws.amazon
.com/blogs/developer/python-support-policy-updates-for-aws-sdks-and-tools/
  warnings.warn(warning, PythonDeprecationWarning)
2024-02-16 04:11:09,879 sagemaker-containers INFO     No GPUs detected (normal if no gpus installed)
2024-02-16 04:11:09,984 sagemaker-containers INFO     No GPUs detected (normal if no gpus installed)
2024-02-16 04:11:09,999 sagemaker-containers INFO     No GPUs detected (normal if no gpus installed)
2024-02-16 04:11:10,008 sagemaker-containers INFO     Invoking user script