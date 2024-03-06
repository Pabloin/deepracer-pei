from time import time

RECTA_01           = 'RECTA_01'
RECTA_02           = 'RECTA_02'
RECTA_03           = 'RECTA_03'
RECTA_04           = 'RECTA_04'

CURVA_01           = 'CURVA_01'
CURVA_02           = 'CURVA_02'
CURVA_03           = 'CURVA_03'
CURVA_04           = 'CURVA_04'
CURVA_05           = 'CURVA_05'
CURVA_06           = 'CURVA_06'

RECTA_INI          = 'RECTA_INI'
RECTA_FIN          = 'RECTA_FIN'

VALUE_ZERO = 1e-3


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

class RewardContext:

    def __init__(self, verbose=False):
        self.previous_steps = None
        self.initial_time = None
        self.verbose = verbose

    @staticmethod
    def get_timestamp(params):
        ts = params.get('timestamp', None) 
        return ts or time()
    
    @staticmethod
    def is_new_lap(step_prev, step):
        if step_prev is None:
            return True
        if step_prev > step:
            return True
        return False

    def reward_function(self, params):
        
        steps = params['steps']
        speed = params['speed']

        abs_steering = abs(params['steering_angle'])
        
        closest_waypoints    = params['closest_waypoints']

        prev_wp = closest_waypoints[0]
        next_wp = closest_waypoints[1]


        if RewardContext.is_new_lap(self.previous_steps, steps):
            self.initial_time = self.get_timestamp(params)
        else:
            pass

        self.previous_steps = steps

        steering_factor = 1.0
        
        # Penalize reward if the car is steering too much
        ABS_STEERING_UMBRAL = 9 if Track.isRecta(next_wp) else 14
        if abs_steering > ABS_STEERING_UMBRAL:
            steering_factor = 0.7

        reward = float(steering_factor)
        

        if Track.isCurva(next_wp) and speed >= 2:
            reward = VALUE_ZERO

        if self.verbose:
            print(params)

        return reward


myFunction = RewardContext()

def reward_function(params):
    return myFunction.reward_function(params)



