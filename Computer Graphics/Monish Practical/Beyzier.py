#Program for Bezier Curve

import math
import matplotlib.pyplot as plt

def beyzier(control_ptx,control_pty):
    t=0
    xt=0
    yt=0
    x_array= []
    y_array= []
    while(t<=1):
       xt =  pow (1-t, 3) * control_ptx[0] + 3 * t * pow (1-t, 2) * control_ptx[1] + 3 * pow (t, 2) * (1-t) * control_ptx[2] + pow (t, 3) * control_ptx[3]
          
       yt =  pow (1-t, 3) * control_pty[0] + 3 * t * pow (1-t, 2) * control_pty[1] + 3 * pow (t, 2) * (1-t) * control_pty[2] + pow (t, 3) * control_pty[3]



       t+=0.0005

       x_array.append(xt)
       y_array.append(yt)
    plt.plot(x_array,y_array)
    plt.show()

# driver function  
if __name__=='__main__': 
  A= []
  B= []
  for i in range(1,5):
    print('For point ',i)
    A.append(int(input('Enter x : ')))
    B.append(int(input('Enter y : ')))
  beyzier(A,B)    
