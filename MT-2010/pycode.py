import cmath
import math
from matplotlib import pyplot as plt

# Диаметры, ограничивающие перемещение центра масс
D_mass_center_max = 13
D_mass_center_min = 5.8

angular_delta = 15
angle = 90

def real_to_math_yaw(yaw):
    """returns yaw in Degrees"""
    math_yaw = -1 # 360 - yaw
    yaw %= 360
    
    if yaw >= 0 and yaw <= 90:
        math_yaw = 90 - yaw
    elif yaw > 90 and yaw < 180:
        delta = yaw - 90
        math_yaw = 360 - delta
    elif yaw >= 180 and yaw < 270:
        delta = yaw - 180
        math_yaw = 270 - delta
    else:
        delta = yaw - 270
        math_yaw = 180 - delta
        
    return math_yaw


def real_to_math_yaw_2(yaw):
    yaw %= 360
    return (360 + 90 - yaw) % 360


"Test it!"
for i in range(361):
    print("{:2d}:   {:3d}  {:3d} ".format(i, real_to_math_yaw(i), real_to_math_yaw_2(i)))
