DRFC Models

    01-00  Modelo 01 versin 00

- Temporada 2024 - 03 Qualify 

    a) Pista ....

        Competition format:Heat 1 - March circuit
        Track name:Vivalas Speedway
        Race type:Time trial


        vivalas speedway	
            Vivalas Speedway	2021-10-30T00:00:00Z	
            caecer_gp.npy		73.78 meters	1.08 meters		Test Race - Vivalas Speedway																			


_____________________________________
TODO:

    ¿Me traigo los tiempos?
    ¿Me traingo la racing line?



_____________________________________
Tracks:

    caecer_gp-1500-8-2023-12-24-203945_action_space.json
    caecer_gp-1500-8-2023-12-24-203945_with_speed.txt
    caecer_gp-1500-v1.json
    caecer_gp-1500-v2.json
        Redondeo

    caecer_gp-1500-v3.json
        Aca estoy cambiando los valores para normalizar los angulos
        
.............................
Modelos

    - Pg3_v0100z

        Este modelo / serie es el inicial entrenado en spot G5 4x porque la 8X no tenía capacidad ...
        Sería el primero que podría importar para evaluar el tiempo el EDU 

        GMT0 - Empezo
        2024-03-04 02:58:25

        Hora Bs AS
        2024-03-04 00:00:00

        EVAL LuzWIP (1 hora)
        2024-03-04 01:00:00
        Training> Name=main_level/agent, Worker=0, Episode=660, Total reward=27.1, Steps=20612, Training iteration=10


        EVAL LuzWIP-2 (2 hora)


        EVAL LuzWIP-3 (3.24 hora)
        2024-03-04 03:25:00
        Training> Name=main_level/agent, Worker=0, Episode=1737, Total reward=25.9, Steps=70533, Training iteration=28


        EVAL LuzWIP-4 (12.30 horas)

        Me olvidar el modelo prendio ... no se porqué no lo apagó la lambda ... 

        Training> Name=main_level/agent, Worker=0, Episode=3489, Total reward=137.4, Steps=171621, Training iteration=58


        Success, your model was submitted to the 
                  Test Pro 2403 - Vivalas Speedway time trial race! 
                  Your results should be available within 10 minutes.

        12:40 hs - 



.............................
Modelos

    - Pg3_v0100y

        - Podría ponerlo en 0.975
        - y cambiar el learning rate ...
        - Ademaspenalizar un poco el stearing en las rectas ... 

    - Nota:
        - Estoy en modo competición ... 
        - Y tengo USD 300 ...
        - no tiene sentido (creo) evaluar en Academy ... después veo los costos en todo caso ..

.............................
Modelos

    - Pg3_v0100x

        Arrancó 10:09 6/3
        Tiene codigo de Learning Rate
        - Entrena en Racer2 - Prueba en Glaciar ... 

        - Idea - les puedo agregar los cron ... 
        
        - lu subi con Hard de scripts .. 

        Termino a las 15 00
...........................,

    - Pg3_v0100w

        Arrancó 15:39 6/3
        Tiene codigo de Learning Rate
        - Entrena en Racer2 - Prueba en Glaciar ... 

        - tiene las curvas agregadas ... 

      Detuve 18:19

...............
Crontab

    Arranco 21:10   -   Thu Mar  7 00:15:32 UTC 2024

    Update  


    minute  hour  day_of_month month day_of_week command_to_run

    10 *      * * *: ejecuta el comando 10 minutos después de cada hora.
    10 2,4,6  * * *: ejecuta el comando 10 minutos en las hora (2, 4, 6).
    10 2,4,6  7 * *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes (arranca en cero?) 
    10 2,4    7 3 *: ejecuta el comando 10 minutos en las hora (2, 4, 6) - Ed día 7 del mes - en marzo

        Estados - Inicial  0 .. 2
        Estados - Wip1     2 .. 4
        Estados - Wip2
        Estados - Close
        
    10 0      7 3 *  inicio                             GMT-3  22:30
        
    30 1      7 3 *  comando_inicial   (entrena 1.30)
    00 3      7 3 *  comando_wip1
    30 4      7 3 *  comando_final

