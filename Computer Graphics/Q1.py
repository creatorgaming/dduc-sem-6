import numpy as np
import matplotlib.pyplot as plt

def take_input():
    x1 = int(input("Enter x1 coordinate for line : "))
    y1 = int(input("Enter y1 coordinate for line : "))
    x2 = int(input("Enter x2 coordinate for line : "))
    y2 = int(input("Enter y2 coordinate for line : "))

    cofficients = np.polyfit([x1,x2],[y1,y2], 1)
    slope = round(cofficients[0],3)
    constant = round(cofficients[1],3)
    
    print('slope', slope) 
    print('const', constant) 

    plt.plot([x1,x2],[y1,y2],color='green',label='Line')
    algo(x1,x2,y1,y2,slope,constant)

def equation(x,slope,constant):
    return (slope*x +constant)

def algo(x1,x2,y1,y2,slope,constant):
    
    if x2 < x1 or y2 < y1:
        x1, x2 = x2, x1
        y1, y2 = y2, y1
    
    yk = y1
    xk_points = [x1]
    yk_points = [y1]

    for x in range(x1+1,x2+1):
        pt_intersection = equation(x,slope,constant)            
        # print("PT : ", pt_intersection)
        if y2 < y1:
            d1 = abs(yk-1 - pt_intersection)
            d2 = abs(pt_intersection - yk)
        else:
            d1 = abs(yk+1 - pt_intersection)
            d2 = abs(pt_intersection - yk)
            
        print(d1,d2)
        if d1 < d2:
            if y1 > y2:
                yk = yk - 1
            else:
                yk = yk + 1
        xk_points.append(x)
        yk_points.append(yk)
        print('(',x,',',yk,')')
    plt.plot(xk_points,yk_points,color='red',label='Points found')    

take_input()
# t = np.arange(0,5,0.2)
plt.grid(True)
plt.legend()
plt.show()