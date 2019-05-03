#Program to apply rotation on a 2D object

import math
import numpy as np
import matplotlib.pyplot as plt


def rotation(coordinate_matrix,angle,pt):
    x = math.radians(angle)
    T= np.array([[math.cos(x),math.sin(x)],
                 [-math.sin(x),math.cos(x)]])

    new_matrix= coordinate_matrix.dot(T)

    
    print('New Coordinates : ')
    for i in range (0,pt):
        print('x = ',new_matrix[i][0],' y = ',new_matrix[i][1])


# driver function  
if __name__=='__main__': 
  
  pt=int(input('Enter the number of coordinate points of the object : '))
  c_matrix = []
  
  for i in range(0,pt):
    print('For point ',i+1)
    A= []
    A.append(int(input('Enter x : ')))
    A.append(int(input('Enter y : ')))
    
    c_matrix.append(A)
  c_matrix= np.array(c_matrix)  
  a=int(input('Enter the angle of rotation : '))
  rotation(c_matrix,a,pt)  
