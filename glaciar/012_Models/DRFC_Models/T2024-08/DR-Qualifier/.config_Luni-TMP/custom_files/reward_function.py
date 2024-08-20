import math

class LuniCar:

    def __init__(self):
        self.proge_prev = 0
        self.steps_prev = 0
        self.steps_now = 0
    
    def reko_fun(self, params):
        
        angle_kar = params['steering_angle']
        angle_car = abs(angle_kar)

        stp = params['steps']
        hd = params['heading']
        wc = params['closest_waypoints']
        wp = params['waypoints']
    
        pp0 = wp[wc[0]]
        pp1 = wp[wc[1]]


        recompensa = 1e-4  # SIN RECOMPENSA

        progre = max(0, params['progress'])
        
        if params['is_offtrack'] and (progre != 100):
            return self.recompensar(recompensa)

        if stp == 1:
            self.proge_prev = 0
            self.steps_prev = self.steps_now
            self.steps_now = 0
        else:
            self.steps_now = self.steps_now + 1

        recompensa = progre - self.proge_prev
        self.proge_prev = progre

        if progre >= 100 and (self.steps_now < self.steps_prev):
            recompensa = recompensa + 10.0

        rrkkoo = self.progress_level_eval(stp, progre)

        recompensa = recompensa + rrkkoo

        g_diff = abs(math.degrees(math.atan2(pp1[1] - pp0[1], pp1[0] - pp0[0])) - hd)

        if g_diff > 180:
            g_diff = 360 - g_diff


        ANGULO_MAX = 25
        CABEZA_MAX = 15

        if g_diff > ANGULO_MAX or angle_car > CABEZA_MAX:
            recompensa = recompensa * 0.8

        return self.recompensar(recompensa)

    def recompensar(self, reko):
        return float(max(1e-4, reko))
    

    def progress_level(self, stp, progre, MAX_STEPS):
        if (stp % 25) == 0 and progre > (stp / MAX_STEPS) * 100 :
            return True
        return False

   
    def progress_level_eval(self, stp, progre):

        SETPS_MAX_L01 = 290  # 1   +1
        SETPS_MAX_L02 = 280  # 2   +1

        SETPS_MAX_L03 = 270  # 4   +1
        SETPS_MAX_L04 = 265  # 6   +2
        SETPS_MAX_L05 = 260  # 8   +2
        SETPS_MAX_L06 = 256  # 10  +2

        SETPS_MAX_L07 = 253  # 12  +4
        SETPS_MAX_L08 = 250  # 16  +4
        SETPS_MAX_L09 = 247  # 20  +4
        SETPS_MAX_L10 = 244  # 24  +4

        SETPS_MAX_L11 = 242  # 28  +4
        SETPS_MAX_L12 = 240  # 32  +4


        if self.progress_level(stp, progre, SETPS_MAX_L12):
            return 32.0

        if self.progress_level(stp, progre, SETPS_MAX_L11):
            return 28.0
                
        if self.progress_level(stp, progre, SETPS_MAX_L10):
            return 24.0
        
        if self.progress_level(stp, progre, SETPS_MAX_L09):
            return 20.0

        if self.progress_level(stp, progre, SETPS_MAX_L08):
            return 16.0

        if self.progress_level(stp, progre, SETPS_MAX_L07):
            return 12.0

        if self.progress_level(stp, progre, SETPS_MAX_L06):
            return 10.0

        if self.progress_level(stp, progre, SETPS_MAX_L05):
            return 8.0
        
        if self.progress_level(stp, progre, SETPS_MAX_L04):
            return 6.0

        if self.progress_level(stp, progre, SETPS_MAX_L03):
            return 4.0
        
        if self.progress_level(stp, progre, SETPS_MAX_L02):
            return 2.0

        if self.progress_level(stp, progre, SETPS_MAX_L01):
            return 1.0
        
        return 0.0

dr = LuniCar()

def reward_function(params):
    return dr.reko_fun(params)


