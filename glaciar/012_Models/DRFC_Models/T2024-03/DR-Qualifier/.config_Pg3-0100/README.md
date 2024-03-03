# deepracer-pei

-------------------------------------------------------------
Experimento siguiendo a Pg3-0100

    Este lo había entrenado y lo importé en Luz ... 
    Pero creo que me dio un error al importarlo y se qujedo con error ... 

    Podría
    a) Entrenar de nuevo a 0100 con Racer2 spot ...
    b) Mandar al modelo a evaluarlo a un profile de academy 
       y después borrarlo porque total es todo tmp y acumulativo ...
    c) Si todo va bien  ... lo envío a glaciar ...
       racer1 es entrenado ... 

       también quería cambiar el codigo para que no parezca de una función
       copy&paste copiada .. 

       y ajustar al action space ...  

-------------------------------------------------------------
TASA:

   23:34 hs
      2024-03-03 00:34:54.429288: W tensorflow/core/common_runtime/
      DoorMan: installing SIGINT, SIGTERM
      Training> Name=main_level/agent, Worker=0, Episode=1, Total reward=35.7, Steps=40, Training iteration=0   

   22:00 hs
      Training> Name=main_level/agent, Worker=0, Episode=900, Total reward=18.6, Steps=23010, Training iteration=8  


   22:05 hs
      Training> Name=main_level/agent, Worker=0, Episode=1000, Total reward=13.5, Steps=26032, Training iteration=9  

   22:30 hs
      Training> Name=main_level/agent, Worker=0, Episode=1123, Total reward=21.9, Steps=29606, Training iteration=11

      Aca hice Ctrl +C  por impaciente ... 


   => En 1000 episodios 

        21:35
        22:95    
      - 30 minutos 
      - con 24 workers
      - 1000 episodios a 100 operaciones ...

   ..............................................
TODO:

   ¿Como agrego el Log analisis fuera del docker y mantenie do a las versiones?

--------------------------------
Hay algo malo con esta config...

   Importé los modelos 0100 y 0100a 
      tanto en glaciar como en Luz y dice que no exite el checkpoint ... 

      No se que pasa ... se me ocurre algo de los workers ... 

         Name
         Error status
         Help
         Pg3-0100-Luz	
         Checkpoint does not exist
         Import model manually
         Pg3-0100a-Luz	
         Checkpoint does not exist
         Import model manually
         Pg3-0100aLuz	
         Checkpoint does not exist
         Import model manually

