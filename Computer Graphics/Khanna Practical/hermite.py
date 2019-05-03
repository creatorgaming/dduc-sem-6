from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend, subplots
from numpy import arange

u = arange(0.0, 1.01, 0.01)
h1 = 2 * u ** 3 - 3 * u ** 2 + 1
h2 = -2 * u ** 3 + 3 * u ** 2
h3 = u ** 3 - 2 * u ** 2 + u
h4 = u ** 3 - u ** 2

print('Note: Please input all points in proper sequence')
n = int(input('Number of Points: '))
px, py, p = [], [], []
for i in range(n):
    x, y, ma, mb = map(int, input('Point {} with tangent point: '.format(i + 1)).split())
    p.append((x, y, ma - x, mb - y))
    px.append(x)
    py.append(y)
print()

for i in range(n - 1):
    xx = h1 * p[i][0] + h2 * p[i + 1][0] + h3 * p[i][2] + h4 * p[i + 1][2]
    yy = h1 * p[i][1] + h2 * p[i + 1][1] + h3 * p[i][3] + h4 * p[i + 1][3]
    plot(xx, yy, label = 'Polynomial {}'.format(i + 1))

gcf().canvas.set_window_title('Piecewise Interpolated Cubic Hermite Spline')
xlabel('X - Axis')
ylabel('Y - Axis')

plot(px, py, 'o', label = 'Points')
legend()

subplots()
gcf().canvas.set_window_title('Cubic Hermite Spline')
xlabel('Parameter - U')
ylabel('P (U)')

plot(u, h1, label = 'H1')
plot(u, h2, label = 'H2')
plot(u, h3, label = 'H3')
plot(u, h4, label = 'H4')

legend()
show()
