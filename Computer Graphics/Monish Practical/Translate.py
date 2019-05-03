#Program to apply rotation on a 2D object

import math
import numpy as np
import matplotlib.pyplot as plt


def translate(coordinate_matrix,point,pt):
    
    T= np.array([[1,0,0],
                 [0,1,0],
                 [point[0],point[1],1]])

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
    A.append(1)
    
    c_matrix.append(A)
  c_matrix= np.array(c_matrix)
  point = []
  a=int(input('Enter the x coordinate of the point : '))
  point.append(a)
  a=int(input('Enter y coordinate of the point : '))
  point.append(a)
  translate(c_matrix,point,pt)  
