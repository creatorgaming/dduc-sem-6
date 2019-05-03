import matplotlib.pyplot as plt
import numpy as np
import math

startx = int(input("Enter start x : "))
starty = int(input("Enter start y : "))
endx = int(input("Enter end x : "))
endy = int(input("Enter end y : "))
stepx = 0
stepy = 0
if(startx > endx):
	startx,endx = endx,startx
	starty,endy = endy,starty
points = [[startx],[starty]]

print("Starting Coordinates : ",startx,starty)
print("End Coordinates : ",endx,endy)

plt.plot([startx,endx],[starty,endy],color='green',label="Original Line")

dellx = abs(startx - endx)
delly = abs(starty - endy)
m = (endy-starty)/(endx - startx)

print("Change in x : ",dellx)
print("Change in y : ",delly)

if(m > 0):
	if(dellx > delly):
		stepx = 1
		stepy = (delly/dellx)
	else:
		stepx = (dellx/delly)
		stepy = 1	
else :
	if(dellx > delly):
		stepx = -1
		stepy = (delly/dellx)
	else:
		stepx = -(dellx/delly)
		stepy = 1

print("Step size x : ",stepx)
print("Step size y : ",stepy)
print("Slope is : ",m)

while(math.floor(startx) != math.floor(endx) and math.floor(starty) != math.floor(endy)):
	startx = startx + stepx
	starty = starty + stepy
	points[0].append(startx)
	points[1].append(starty)

	print(startx,starty)

plt.plot(points[0],points[1],'bo',label="Points")
plt.grid(True)
plt.legend()
plt.show()	
