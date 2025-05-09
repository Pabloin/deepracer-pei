# Luz - tem88-test-v001
# Preparada para GPU

import math

class Alfetta:
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
        MIN_REWARD = 1e-4
        MAX_STEPS = 270

        reward=MIN_REWARD
        if steps == 1:
            self.pre_progress = 0
            self.pre_steps_for_lap = self.current_steps_for_lap
            self.current_steps_for_lap = 0
        else:
            self.current_steps_for_lap += 1

        if is_offtrack and progress != 100:  # Punish off tracks.
            return float(max(MIN_REWARD, reward))
        else:
            reward = progress - self.pre_progress
            self.pre_progress = progress

             # Give additional reward if the car pass every 25 steps faster than expected
            if (steps % 25) == 0 and progress > (steps / MAX_STEPS) * 100 :
                print("5")
                reward += 5.0

            # Reward if the current lap is completed in less steps than the previous lap
            if progress >= 100 and self.current_steps_for_lap < self.pre_steps_for_lap:
                reward += 10.0

        return float(max(MIN_REWARD, reward))


myCarObject = Alfetta()

def reward_function(params):
    return myCarObject.reward_function(params)



