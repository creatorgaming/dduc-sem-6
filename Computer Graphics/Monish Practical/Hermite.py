#Program to draw  hermite curve

import math
import matplotlib.pyplot as plt


def hermite(control_ptx,control_pty):
    t=0
    xt=0
    yt=0
    x_array= []
    y_array= []
    while(t<=1):
       H0= 2 * pow(t,3) - 3 * pow(t,2) + 1
       H1= -2 * pow(t,3) + 3 * pow(t,2)
       H2= pow(t,3) - 2 * pow(t,2) + t
       H3= pow(t,3) - pow(t,2)

       xt = H0 * control_ptx[0] + H1 * control_ptx[1] + H2 * control_ptx[2] + H3 * control_ptx[3]
       yt = H0 * control_pty[0] + H1 * control_pty[1] + H2 * control_pty[2] + H3 * control_pty[3]
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
  hermite(A,B)    
