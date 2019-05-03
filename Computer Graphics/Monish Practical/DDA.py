import math
import matplotlib.pyplot as plt
def dda(x1,y1,x2,y2):
 dx= x2-x1
 dy= y2-y1
 m= math.floor(dy/dx)
 y_prev= y1
 print("Slope : ",m)
 x_array = []
 y_array = []
 for x in range (x1+1,x2):
     y= y_prev + m
     print("(",x,",",y,")")
     x_array.append(x)
     y_array.append(y)
     y_prev= y
 plt.plot(x_array,y_array)
 plt.show()

if __name__=='__main__': 
    x1 = 1
    y1 = 3
    x2 = 5
    y2 = 7
    dda(x1, y1, x2, y2)  
