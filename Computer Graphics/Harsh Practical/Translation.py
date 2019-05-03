import matplotlib.pyplot as plt
import numpy as np

npoints = int(input("Enter Number of Points in the Object : "))
points = [[],[]]

for i in range(npoints):
	x = int(input("Enter x coordinate : "))
	y = int(input("Enter y coordinate : "))
	points[0].append(x)
	points[1].append(y)

plt.plot(points[0],points[1],'og-',label="Original Object")

transx = int(input("Enter X-Translation Factor : "))
transy = int(input("Enter Y-Translation Factor : "))

transMatrix = np.matrix([[1,0,0],[0,1,0],[transx,transy,1]])
points = np.matrix(points).getT()
temp = np.ones((npoints,1),dtype=int)
points = np.append(points,temp,axis=1)

newPoints = points.dot(transMatrix)
newPoints = newPoints.tolist()

points = [[],[]]
for i in range(len(newPoints)):
	points[0].append(newPoints[i][0])
	points[1].append(newPoints[i][1])

plt.plot(points[0],points[1],'or-',label="Translated Object")

plt.legend()
plt.show()