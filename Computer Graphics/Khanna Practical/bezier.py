from matplotlib.pyplot import gcf, xlabel, ylabel, plot, legend, show, subplots
from numpy import arange

print('Note: Please input all points in proper sequence')
n = int(input('Number of Points: '))
p, px, py = [], [], []
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))
print()

for i in range(n - 1):
    plot([p[i][0], p[i + 1][0]], [p[i][1], p[i + 1][1]], '--', color = 'grey')

plot([p[0][0], p[n - 1][0]], [p[0][1], p[n - 1][1]], '--', color = 'grey', label = 'Convex Hull')

fact = [1]
for i in range(1, n + 1):
    fact.append(fact[-1] * i)

def b(i, t):
    c = fact[n - 1] // fact[i] // fact[n - 1 - i]
    return c * t ** i * (1 - t) ** (n - 1 - i)

gcf().canvas.set_window_title('Bezier Curve for Given Points')
xlabel('X - Axis')
ylabel('Y - Axis')
plot(px, py, 'o', label = 'Points')

fx, fy = [], []
u = arange(0.0, 1.01, 0.01)
for t in u:
    t_x, t_y = 0, 0
    for i in range(n):
        t_b = b(i, t)
        t_x += px[i] * t_b
        t_y += py[i] * t_b
    fx.append(t_x)
    fy.append(t_y)

plot(fx, fy, label = 'Bezier Curve')
legend()

b0 = (1 - u) ** 3
b1 = 3 * u * (1 - u) ** 2
b2 = 3 * u ** 2 * (1 - u)
b3 = u ** 3

subplots()
gcf().canvas.set_window_title('General Cubic Bezier Curve for 4 Control Points')
xlabel('Parameter - U')
ylabel('B (i, n)')

plot(u, b0, label = 'B (0, 3)')
plot(u, b1, label = 'B (1, 3)')
plot(u, b2, label = 'B (2, 3)')
plot(u, b3, label = 'B (3, 3)')

legend()
show()
