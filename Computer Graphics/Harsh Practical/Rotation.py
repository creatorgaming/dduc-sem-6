import matplotlib.pyplot as plt
import numpy as np
import math

npoints = int(input("Enter Number of Points in the Object : "))
points = [[],[]]

for i in range(npoints):
	x = int(input("Enter x coordinate : "))
	y = int(input("Enter y coordinate : "))
	points[0].append(x)
	points[1].append(y)

plt.plot(points[0],points[1],'og-',label="Original Object")

theta = int(input("Enter Angle of rotation (degree)"))
theta = ((math.pi)/180)*theta

rotMatrix = np.matrix([[math.cos(theta),-math.sin(theta)],[math.sin(theta),math.cos(theta)]])

points = np.matrix(points).getT()

newPoints = points.dot(rotMatrix)
newPoints = newPoints.tolist()

points = [[],[]]
for i in range(len(newPoints)):
	points[0].append(newPoints[i][0])
	points[1].append(newPoints[i][1])

plt.plot(points[0],points[1],'or-',label="Rotated Object")

plt.legend()
plt.show()