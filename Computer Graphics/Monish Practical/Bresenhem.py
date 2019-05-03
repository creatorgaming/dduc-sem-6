# Bresenham Line generation

import math
import matplotlib.pyplot as plt
def bresenham(x1,y1,x2, y2):  
  
    dx= x2-x1
    dy= y2-y1
    P= 2*dy-dx
    x_array=[]
    y_array=[]
    x_array.append(x1)
    y_array.append(y1)
    x= x1 
    y=y1 
    for i in range(x1,x2+1):  
      
        print("(",x ,",",y ,")\n")  
        if(P>=0):
           x= x+1
           y= y+1
           P= P+2*dy-2*dx
        else:
           x= x+1
           P= P+2*dy
        x_array.append(x)
        y_array.append(y)   
    plt.plot(x_array,y_array)
    plt.show()
  
  
# driver function  
if __name__=='__main__': 
    x1 = 1
    y1 = 1
    x2 = 5
    y2 = 3
    bresenham(x1, y1, x2, y2)  
  
