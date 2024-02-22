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



____________________
Otra pregunta para hacerme es donde están los logs ...
    En realidad se donde están...
    Pero no se si se guardan o se pierden ....
    Me interesaría ver que tan rápido es una instancias G5 vs otra ...
    Es decir a que hora llega al episodio X ... 


