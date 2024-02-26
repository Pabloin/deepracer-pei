# deepracer-pei

Continua a Luz-100

-------------------------
Test Race 
    
    Baadal Track
    AmericasGeneratedInclStart

    Voy a replicar a la reward de 
        - 6000 episodios y 
        - 100 iteraciones 
        - de Tomas
        - en una G6

-------------------------
Ideas:

    a) Modificar los learning rate - etc - los hiper parametros a ver que pasa ... 
    b) Modificar el action space de la velocidad a algo mas veloz o 
        a algo que de mas .. 
    

-------------------------
Dudas:

    ¿Como es eso de elegit algún checpoint distinto para evaluar / etc ? 

-------------------------

NOTA:

    No me deja entrenar ... 
    porque el anterior era de 100 es de 14 el actoin space y este de 21
     
    ValueError: Failed to restore agent's checkpoint: Cannot feed value of shape (512, 14) for Tensor 'Placeholder_20:0', which has shape '(512, 21)'

____________________
Nota 2024-02-22

    Con este experimento...
    - Estoy probando si el action space generado es mejor que el mío
    - No pude entrenar un modelo 101 a partir del 100 porque:
        - En G5 spot1 de racer1 - el minio estaba lleno 
        - En G5 spot2 de racer1 - esta vacio pero no esta el modelo 100 ... y no se importarlo ... 
        - Capaz hacer un G5 en racer2 (san Pablo) ... y ver ...


    Hasta el Episodop 2000
    - LUZ-101-Ini-Ep2000

        Empezó aprox: 
        2024/02/22 10:15 GMT-3  (Es Launch timpe no start training)

        Starting 6 workers
        Creating Robomaker configuration in s3://bucket-models-2024-01/Spot-Tracks/LUZ-101/training_params.yaml
        Creating service deepracer-0_rl_coach
        Creating service deepracer-0_robomaker
        Waiting up to 15 seconds for Sagemaker to start up...
        20:C 22 Feb 2024 13:41:08.755 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
        20:C 22 Feb 2024 13:41:08.755 # Redis version=6.2.7, bits=64, commit=00000000, modified=0, pid=20, just started
        20:C 22 Feb 2024 13:41:08.755 # Configuration loaded

        Start en GMT -3

        22 Feb 2024 10:41:08.755 # Configuration loaded

        Episodio 2000
        2024/02/22 13:15 GMT-3  (captura de pantalla del log)

        Training Aprox - 1.35 hs

        El modelo bien... tuvo dos Off Tracks y la veulta limpia en 17 / 18 segundos ---
        Entrenó dos horas y asi los mismos resultados que el otro que entrenó 24 horas ...
        Voy a darle quizá mil episodios mas a ver si lo completa sin off tracks
        Igual necesito mas velocidad para desplazar al primer modelo que hace la vuelta en 16 ... 


    Hasta el Episodop 3000
    - LUZ-101-Ini-Ep3000
    - LUZ-101-Upg-Ep3000
    - LUZ-101-End-Ep3160

        Episodio 2000
        2024/02/22 13:15 GMT-3  (captura de pantalla del log)

        Training Aprox - 1.35 hs

        Episodio 3000
        2024/02/22 15:38 GMT-3  (captura de pantalla del log)

        Training Aprox - 2.25 hs

        Training Total - 4.00 hs
____________________
Otra pregunta para hacerme es donde están los logs ...
    En realidad se donde están...
    Pero no se si se guardan o se pierden ....
    Me interesaría ver que tan rápido es una instancias G5 vs otra ...
    Es decir a que hora llega al episodio X ... 


____________________
Nota 2024-02-26

    Vamos con 101a


PREFIX='model-name'   # Name of the model, without trailing '/'
BUCKET='bucket'       # Bucket name is default 'bucket' when training locally
PROFILE=None          # The credentials profile in .aws - 'minio' for local training
S3_ENDPOINT_URL=None  # Endpoint URL: None for AWS S3, 'http://minio:9000' for local training

PREFIX='Spot-Tracks/LUZ-101a'
BUCKET='bucket-models-2024-01'
S3_ENDPOINT_URL='http://minio:9000'

AmericasGeneratedInclStart