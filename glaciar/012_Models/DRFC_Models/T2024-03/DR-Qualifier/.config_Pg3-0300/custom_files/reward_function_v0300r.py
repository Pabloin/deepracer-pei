# La funcion PEI estaba haciendo convergencia hasta aqui ...
# sin la racing line - también creo que era similar a version CSV

import math

RECTA_01     = 'RECTA_01'
RECTA_02     = 'RECTA_02'
RECTA_03     = 'RECTA_03'
RECTA_04     = 'RECTA_04'

CURVA_01     = 'CURVA_01'
CURVA_02     = 'CURVA_02'
CURVA_03     = 'CURVA_03'
CURVA_04     = 'CURVA_04'
CURVA_05     = 'CURVA_05'

RECTA_INI    = 'RECTA_INI'
RECTA_FIN    = 'RECTA_FIN'

ZERO_REWARD  = 1e-3
MODE_DEBUG   = True


class Track:


    # vivalas speedway - caecer_gp.npy
    # 73.78 meters	1.08 meters
    Zones = [

        [RECTA_01,  25,  35, RECTA_INI ],
        [RECTA_02,  53,  64 ],
        [RECTA_03,  91, 102 ],
        [RECTA_04, 181, 182, RECTA_FIN],

#       [CURVA_01,  65,  85 ],
        [CURVA_02, 102, 120 ],
        [CURVA_03, 138, 150 ],
        [CURVA_04, 168, 176 ],
#       [CURVA_05, 200, 216 ],

        []
    ]

    #----------------------------------------------------------------------------------------------------
    # Dice la zona< > 
    @staticmethod
    def isz(z, wp):
        isInZone = False
        for zone in Track.Zones:
            if ( z in zone and wp in range(zone[1], zone[2]+1) ):
                if MODE_DEBUG:
                   print(f"isz({z},{wp})=True")
                return True
        return isInZone

    #----------------------------------------------------------------------------------------------------
    # Dice si es una Recta - TDD
    isRecta = lambda wp : (Track.isz(RECTA_01, wp) or Track.isz(RECTA_02, wp) or 
                           Track.isz(RECTA_03, wp) or Track.isz(RECTA_04, wp))

    isCurva = lambda wp : (Track.isz(CURVA_01, wp) or Track.isz(CURVA_02, wp) or 
                           Track.isz(CURVA_03, wp) or Track.isz(CURVA_04, wp) or 
                           Track.isz(CURVA_05, wp))

    #----------------------------------------------------------------------------------------------------
    # Direction de la Pista en Grados
    # - Calculate la direccion de la pista en grados (atan2)
    # - the direction in radius, arctan2(dy, dx), the result is (-pi, pi) in radians
    # ... Podría calcular los xy para la direccion de la racing line ... 
    #                            TDD:  reward_TDD_Track.py - test_xSpeedCastigo
    @staticmethod
    def _direccionPista(params):
       
        waypoints         = params['waypoints']
        closest_waypoints = params['closest_waypoints']

        wpNext = waypoints[closest_waypoints[1]]
        wpPrev = waypoints[closest_waypoints[0]]

        dirPista = math.degrees(math.atan2(wpNext[1] - wpPrev[1], 
                                           wpNext[0] - wpPrev[0]))

        #-------------------------------------------------------------
        if MODE_DEBUG:
            try:
                print(f"Track._direccionPista(closest_waypoints={closest_waypoints}): wpNext={wpNext}, wpPrev={wpPrev}, dirPista={dirPista}")
            except Exception as e:
                print("Excepcion e:", e)

        return dirPista
    


class Reward:

    #----------------------------------------------------------------------------------------------------
    # Penalize reward factor if the car is steering too much
    @staticmethod
    def fn_abs_steering_factor(params):

        closest_waypoints = params['closest_waypoints']
        prev_wp = closest_waypoints[0]
        next_wp = closest_waypoints[1]

        abs_steering = abs(params['steering_angle'])
    
        steering_factor = 1.0

        # Penalize reward if the car is steering too much
        ABS_STEERING_UMBRAL = 10 if Track.isRecta(next_wp) else 15        
        if abs_steering > ABS_STEERING_UMBRAL:
            steering_factor = 0.7

        return steering_factor


    #----------------------------------------------------------------------------------------------------
    # Se le da recompensa si el agente no está Off Track pero dentro de los bordes
    @staticmethod
    def fn_inside_track_factor(params):

        # Read input parameters
        all_wheels_on_track = params['all_wheels_on_track']
        distance_from_center = params['distance_from_center']
        track_width = params['track_width']
        
        inside_factor = 0.7

        if all_wheels_on_track and (0.5*track_width - distance_from_center) >= 0.05:
            inside_factor = 1.0
            # Podria ser  inside_factor * (0.5*track_width - distance_from_center) 

        return float(inside_factor)
    
    #----------------------------------------------------------------------------------------------------
    # Castigo por Heading vs DirPista (fn_diff_heading_track)  - TDD:  fn_curvaturas.py - fn_rectas_heading
    @staticmethod
    def fn_curvaturas_factor(params):
       
        heading = params['heading']

        dirPista = Track._direccionPista(params) 

        dirDiff = abs(dirPista - heading)

        if dirDiff > 180:
           dirDiff = 360 - dirDiff
            
        curvas_factor = 1.0

        # Punish Reward if heading vs track is low
        ABS_DIFF_DEGREE_THRESHOLD = 10
        if dirDiff > ABS_DIFF_DEGREE_THRESHOLD:
            curvas_factor = 0.6

        return float(curvas_factor)
                   

    @staticmethod
    def fn_curva_factor(params):
        
        speed = params['speed']
        closest_waypoints = params['closest_waypoints']
        prev_wp = closest_waypoints[0]
        next_wp = closest_waypoints[1]

        curva_factor = 1.0
        
        if Track.isCurva(next_wp) and speed >= 1.5:
            curva_factor = ZERO_REWARD

        return float(curva_factor)


def reward_function(params):

    reward = ZERO_REWARD

    # Entre 0 y 1
    steering_reward = 1
    steering_factor = Reward.fn_abs_steering_factor(params)
    steering_weigth = float(steering_reward * steering_factor)

    # Entre 0 y 1
    inside_reward = 1
    inside_factor = Reward.fn_inside_track_factor(params)
    inside_weigth = float(inside_reward * inside_factor)

    # Entre 0 y 1
    curvatura_reward = 1
    curvatura_factor = Reward.fn_curvaturas_factor(params)
    curvatura_weigth = float(curvatura_reward * curvatura_factor)

    # Entre 0 y 1
    curva_reward = 1
    curva_factor = Reward.fn_curva_factor(params)
    curva_weigth = float(curva_reward * curva_factor)

    reward = reward + (steering_weigth  + inside_weigth + 
                       curvatura_weigth + curva_weigth)

    return float(reward)


