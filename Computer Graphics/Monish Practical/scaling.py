#Program to apply rotation on a 2D object

import math
import numpy as np
import matplotlib.pyplot as plt


def scale(coordinate_matrix,scale_factors,pt):
    
    T= np.array([[scale_factors[0],0],
                 [0,scale_factors[1]]])

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
  scale_m = []
  a=float(input('Enter the scaling factor for x : '))
  scale_m.append(a)
  a=float(input('Enter the scaling factor for y : '))
  scale_m.append(a)
  scale(c_matrix,scale_m,pt)  
