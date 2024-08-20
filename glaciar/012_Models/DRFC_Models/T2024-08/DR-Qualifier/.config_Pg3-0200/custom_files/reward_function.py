
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
CURVA_06     = 'CURVA_06'

RECTA_INI    = 'RECTA_INI'
RECTA_FIN    = 'RECTA_FIN'

ZERO_REWARD = 1e-3


MODE_DEBUG = True

class Track:

    # vivalas speedway - caecer_gp.npy
    # 73.78 meters	1.08 meters
    Zones = [

        [RECTA_01,  25,  35, RECTA_INI ],
        [RECTA_02,  53,  64 ],
        [RECTA_03,  91, 102 ],
        [RECTA_04, 181, 182, RECTA_FIN],

        [CURVA_01,  65,  85 ],
        [CURVA_02, 102, 120 ],
        [CURVA_03, 138, 150 ],
        [CURVA_04, 168, 176 ],
        [CURVA_05, 168, 176 ],
        [CURVA_06, 200, 216 ],

        []
    ]

    
    #----------------------------------------------------------------------------------------------------
    # Dice la zona
    # < > 
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
    isRecta = lambda wp : (Track.isz(RECTA_01, wp) or 
                           Track.isz(RECTA_02, wp) or 
                           Track.isz(RECTA_03, wp) or 
                           Track.isz(RECTA_04, wp))

    isCurva = lambda wp : (Track.isz(CURVA_01, wp) or 
                           Track.isz(CURVA_02, wp) or 
                           Track.isz(CURVA_03, wp) or 
                           Track.isz(CURVA_04, wp) or 
                           Track.isz(CURVA_05, wp) or 
                           Track.isz(CURVA_06, wp))


class RewardClass:
    def __init__(self):
        self.pre_progress = 0
        self.pre_steps_for_lap = 0
        self.current_steps_for_lap = 0

    def reward_function(self, params):
        progress = max(0, params['progress'])
        steps = params['steps']
        speed = params['speed']
        is_offtrack = params['is_offtrack']
        x = params['x']
        y = params['y']

        abs_steering = abs(params['steering_angle'])
        closest_waypoints    = params['closest_waypoints']
        prev_wp = closest_waypoints[0]
        next_wp = closest_waypoints[1]

        MAX_STEPS = 280

        reward=ZERO_REWARD
        if steps == 1:
            self.pre_progress = 0
            self.pre_steps_for_lap = self.current_steps_for_lap
            self.current_steps_for_lap = 0
        else:
            self.current_steps_for_lap += 1

        # Movimientos imposibles
        if is_offtrack and progress < 100:  
            return ZERO_REWARD

        if Track.isCurva(next_wp) and speed >= 2:
            return ZERO_REWARD


        reward = progress - self.pre_progress
        self.pre_progress = progress

        # Hay una recompensa adicional si el vehícuo pasa 25% de los pasos, pasa más rápido que lo esperado
        if (steps % 25) == 0 and progress > (steps / MAX_STEPS) * 100 :
            reward += 5.0

        # Recompensa si la vuelta actual se completa en menos paso que la vuelta anterior
        if progress >= 100 and self.current_steps_for_lap < self.pre_steps_for_lap:
            reward += 10.0




        steering_factor = 1.0
        
        # Penalize reward if the car is steering too much
        ABS_STEERING_UMBRAL = 9 if Track.isRecta(next_wp) else 14
        if abs_steering > ABS_STEERING_UMBRAL:
            steering_factor = 0.7

        reward = float(reward * steering_factor)


        return float(max(ZERO_REWARD, reward))


rw = RewardClass()

def reward_function(params):
    return rw.reward_function(params)

