import matplotlib.pyplot as plt
import numpy as np

npoints = int(input("Enter no of points in the object : "))
points = [[],[]]

for i in range(npoints):
    x = int(input("Enter x coordinate : "))
    y = int(input("Enter y coordinate : "))
    points[0].append(x)
    points[1].append(y)

plt.plot(points[0],points[1],'og-',label="Original Object points")
plt.legend()
plt.grid(1)
plt.show()