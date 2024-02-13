# https://medium.com/@rostyslav.myronenko/aws-deepracer-event-for-epam-my-approach-for-taking-the-4th-place-ff3f76f39b1e

#Badado en scott motivator

def reward_function(params):
    reward = 1.0

    if params["all_wheels_on_track"] and params["steps"] > 0:
        reward = ((params["progress"] / params["steps"]) * 100) + (params["speed"] ** 2)
    else:
        reward = 0.01
    
    if abs(params["steering_angle"]) < 5:
        reward += 1
    
    reward += (params["speed"] / 8)
    
    return float(reward)