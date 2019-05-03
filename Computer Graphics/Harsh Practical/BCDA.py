import matplotlib.pyplot as plt
import numpy as np

r = int(input("Enter radius : "))

def circle(x,y):
	return(abs((x)**2 + (y)**2 - (r)**2))

plt.plot([0,r,0,-r],[r,0,-r,0],'bo',label="Points")

def reeflectedPoints(x,y):
	return([
	[
		x,
		x,
		-x,
		-x,
		y,
		-y,
		y,
		-y
	],
	[
		y,
		-y,
		y,
		-y,
		x,
		-x,
		-x,
		x
	]])


startx = 0
starty = r

while(startx < starty):
	startx = startx + 1

	if(circle(startx,starty) > circle(startx,starty-1)):
		starty = starty - 1
	points = reeflectedPoints(startx,starty)
	print(points)
	plt.plot(points[0],points[1],'bo',label="Points")

plt.grid()
plt.show()	