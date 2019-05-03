import matplotlib.pyplot as plt
import numpy as np

npoints = int(input("Enter Number of Points in the Object : "))
points = [[],[]]

for i in range(npoints):
	x = int(input("Enter x coordinate : "))
	y = int(input("Enter y coordinate : "))
	points[0].append(x)
	points[1].append(y)

scalingx = int(input("Enter X-Scaling Factor : "))
scalingy = int(input("Enter Y-Scaling Factor : "))

plt.plot(points[0],points[1],'og-',label="Original Object")

points = np.matrix(points).getT()
scalingMatrix = np.matrix([[scalingx,0],[0,scalingy]])

newPoints = points.dot(scalingMatrix)
newPoints = newPoints.tolist()

points = [[],[]]
for i in range(len(newPoints)):
	points[0].append(newPoints[i][0])
	points[1].append(newPoints[i][1])

plt.plot(points[0],points[1],'or-',label="Scaled Object")
plt.legend()
plt.show()