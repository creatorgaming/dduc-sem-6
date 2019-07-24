import math
import numpy as np
import matplotlib.pyplot as plt

def take_input():
    r = int(input("Enter radius of circle : "))
    algo(0,0,r)

def algo(x,y,r):
    xk_points = [0]
    yk_points = [r]
    pk = 1 - r
    xk = 1
    if pk >= 0:
        yk = r - 1
    else:
        yk = r        

    #while loop till x <= y
    while xk <= yk:
        if pk >= 0:
            yk = yk - 1
        else:
            yk = yk 
        plt.plot(xk,yk,'bs')
        plt.plot(xk,-yk,'bs')    
        plt.plot(-xk,yk,'bs')    
        plt.plot(-xk,-yk,'bs')                   

        plt.plot(yk,xk,'bs')
        plt.plot(yk,-xk,'bs')    
        plt.plot(-yk,xk,'bs')    
        plt.plot(-yk,-xk,'bs')                   
        
        pk = math.pow(xk+1,2) + math.pow(yk - 0.5,2) - math.pow(r,2)
        xk = xk + 1

take_input()
# t = np.arange(0,5,0.2)
plt.grid(True)
plt.show()