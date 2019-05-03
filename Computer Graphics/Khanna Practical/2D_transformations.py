from math import sin, cos, atan, radians

print('Note: Please input all points in proper sequence')
n = int(input('Number of Points in Object: '))
px, py, p = [], [], []
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))

ta, tb = map(int, input('Enter Translation Distances: ').split())
aa, bb = map(float, input('Enter Scales: ').split())
dir, lam = input('Shear (X or Y) (Shear Constant): ').split()

def bad(c):
    try:
        float(c)
        return False
    except:
        return True

if dir != 'x' and dir != 'X' and dir != 'y' and dir != 'Y' or bad(lam):
    exit('\nBad Shear!\n')

sa, sb = (0.0, float(lam)) if dir == 'x' or dir == 'X' else (float(lam), 0.0)
phi = radians(float(input('Angle of Rotation: ')))
res_x, res_y = [], []

for xx in p:
    res_x.append((xx[0] + ta) * aa)
    res_y.append((xx[1] + tb) * bb)

    x, y = res_x[-1], res_y[-1]
    res_x[-1] = x + sb * y
    res_y[-1] = y + sa * x

    x, y = res_x[-1], res_y[-1]
    res_x[-1] = x * cos(phi) - y * sin(phi)
    res_y[-1] = x * sin(phi) + y * cos(phi)

a, b, c = map(int, input('Enter a, b, c (ax + by + c = 0) [Reflection Mirror]: ').split())

if a == 0 and b == 0:
    exit('\nBad Line!\n')
print('\nPoints after 2D Transformations:\n')

if a == 0:
    for i in range(n):
        res_y[i] = -(res_y[i] + c / b) - c / b
        print('({:.2f}, {:.2f})'.format(res_x[i], res_y[i]))
elif b == 0:
    for i in range(n):
        res_x[i] = -(res_x[i] + c / a) - c / a
        print('({:.2f}, {:.2f})'.format(res_x[i], res_y[i]))
else:
    phi = -atan(-a / b)
    for i in range(n):
        res_x[i] += c / a
        x, y = res_x[i], res_y[i]
        res_x[i] = x * cos(phi) - y * sin(phi)
        res_y[i] = -x * sin(phi) - y * cos(phi)

        x, y = res_x[i], res_y[i]
        res_x[i] = x * cos(-phi) - y * sin(-phi)
        res_y[i] = x * sin(-phi) + y * cos(-phi)
        res_x[i] -= c / a
        print('({:.2f}, {:.2f})'.format(res_x[i], res_y[i]))

print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend
    from numpy import arange, array

    x = arange(min(px + res_x) - 10.0, max(px + res_x) + 10.01, 0.1)
    y = x
    if a == 0:
        y = array([-c / b] * len(x))
    elif b == 0:
        y = arange(min(py + res_y) - 10.0, max(py + res_y) + 10.01, 0.1)
        x = array([-c / a] * len(y))
    else:
        y = (-a * x - c) / b

    gcf().canvas.set_window_title('2D Transformations on an Object')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(px, py, 'o', color = 'green')
    plot(res_x, res_y, 'o', color = 'red')

    for i in range(n - 1):
        plot([px[i], px[i + 1]], [py[i], py[i + 1]], '-', color = 'green')
        plot([res_x[i], res_x[i + 1]], [res_y[i], res_y[i + 1]], '-', color = 'red')

    plot([px[0], px[n - 1]], [py[0], py[n - 1]], '-', color = 'green', label = 'Before Transformations')
    plot([res_x[0], res_x[n - 1]], [res_y[0], res_y[n - 1]], '-', color = 'red', label = 'After Transformations')
    plot(x, y, color = 'blue', label = 'Mirror Line')

    legend()
    show()
