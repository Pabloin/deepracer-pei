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