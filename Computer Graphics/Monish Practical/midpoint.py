#Program to draw acircle using midpoint algorithm

import math
import matplotlib.pyplot as plt

def mid_circle(r):

   P= 5/4.0-r
   x= 0
   y=r

   x_array=[]
   y_array=[]

   
   
   while(x<y):
   

      x_array.append(x)
      y_array.append(y)
      print("(",x ,",",y ,")\n")  
      if(P>=0):
          P= P+2*x-2*y+1
          x=x+1
          y=y-1

      else:
          P= P+2*x+1
          x=x+1
        
      x_array= x_array+ [-x,x,-x,y,y,-y,-y]
      y_array= y_array+ [y,-y,-y,x,-x,-x,x]
          
   plt.plot(x_array,y_array,"bo")
   plt.show()       
# driver function  
if __name__=='__main__': 
  r=50
  mid_circle(r)
          
       
      
   
   
