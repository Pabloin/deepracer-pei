# https://youtu.be/2haOZX3rsm4?si=6_a6C2zJ04RyQStN&t=2861

from time import time

class DeerRacer:

    def __init__(self, verbose=False):
        self.previous_steps = None
        self.initial_time = None
        self.verbose = verbose

    @staticmethod
    def get_timestamp(params):

        # Recordar: No se retornará el tiempo antes de que la 
        # primera vuelta se haya completado.
        # Entonces, el tiempo por vuelta debería ser 
        # bajado aprximadamente 0.2 seg
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
        abs_steering = abs(params['steering_angle'])
        
        if DeerRacer.is_new_lap(self.previous_steps, steps):
            self.initial_time = self.get_timestamp(params)
        else:
            pass

        self.previous_steps = steps

        steering_factor = 1.0
        
        # Penalize reward if the car is steering too much
        ABS_STEERING_UMBRAL = 14
        if abs_steering > ABS_STEERING_UMBRAL:
            steering_factor = 0.7

        reward = float(steering_factor)
        
        if self.verbose:
            print(params)

        return reward


myFunction = DeerRacer()

def reward_function(params):
    return myFunction.reward_function(params)



