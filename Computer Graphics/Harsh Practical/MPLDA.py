import matplotlib.pyplot as plt
import numpy as np

startx = int(input("Enter x co-ordinate of initial point : "))
starty = int(input("Enter y co-ordinate of initial point : "))
endx = int(input("Enter x co-ordinate of end point : "))
endy = int(input("Enter y co-ordinate of end point : "))

coeffn = np.polyfit([startx,endx],[starty,endy],1)

def line(x):
	return coeffn[0]*x + coeffn[1]

if(startx > endx):
	startx,endx = endx,startx
	starty,endy = endy,starty

plt.plot([startx,endx],[starty,endy],color='green',label="Original Line")


points = [[startx],[starty]]

print("points are : ")

while(startx < endx):
	startx = startx + 1

	midpoint = (2*starty + 1)/2
	d = midpoint - line(startx)
	if(d < 0):
		starty = starty + 1
		
	print(startx,starty)
	points[0].append(startx)
	points[1].append(starty)

plt.plot(points[0],points[1],'bo',label="Points")
plt.grid(True)
plt.show()	
