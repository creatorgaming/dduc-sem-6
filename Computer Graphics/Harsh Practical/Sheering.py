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
sheerFac = int(input("Enter Sheering Factor"))

print("\n----Sheering across X-axis----\n")
points = np.matrix(points).getT()
sheeringMatrix = np.matrix([[1,sheerFac],[0,1]])
newPoints = points.dot(sheeringMatrix)
newPoints = newPoints.tolist()

points = [[],[]]
for i in range(len(newPoints)):
	points[0].append(newPoints[i][0])
	points[1].append(newPoints[i][1])

plt.plot(points[0],points[1],'or-',label="Sheered Object")

plt.legend()
plt.show()
