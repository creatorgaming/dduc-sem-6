#Program to apply reflection on a 2D object

import math
import numpy as np
import matplotlib.pyplot as plt


def reflection(coordinate_matrix,pt):
    T= np.array([[1,0],
                 [0,-1]])

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
