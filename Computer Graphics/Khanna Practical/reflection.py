from math import sin, cos, atan

print('Note: Please input all points in proper sequence')
n = int(input('Number of Points in Object: '))
px, py, p = [], [], []
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))

a, b, c = map(int, input('Enter a, b, c (ax + by + c = 0) [Reflection Mirror]: ').split())

if a == 0 and b == 0:
    exit('\nBad Line!\n')
print('\nPoints after Reflection:\n')

res_x, res_y = [], []

if a == 0:
    for xx in p:
        res_x.append(xx[0])
        res_y.append(-(xx[1] + c / b) - c / b)
        print('({:.2f}, {:.2f})'.format(res_x[-1], res_y[-1]))
elif b == 0:
    for xx in p:
        res_x.append(-(xx[0] + c / a) - c / a)
        res_y.append(xx[1])
        print('({:.2f}, {:.2f})'.format(res_x[-1], res_y[-1]))
else:
    phi = -atan(-a / b)
    for xx in p:
        res_x.append(xx[0] + c / a)
        res_y.append(xx[1])

        x, y = res_x[-1], res_y[-1]
        res_x[-1] = x * cos(phi) - y * sin(phi)
        res_y[-1] = -x * sin(phi) - y * cos(phi)

        x, y = res_x[-1], res_y[-1]
        res_x[-1] = x * cos(-phi) - y * sin(-phi)
        res_y[-1] = x * sin(-phi) + y * cos(-phi)
        res_x[-1] -= c / a
        print('({:.2f}, {:.2f})'.format(res_x[-1], res_y[-1]))

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

    gcf().canvas.set_window_title('2D Reflection of an Object')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(px, py, 'o', color = 'green')
    plot(res_x, res_y, 'o', color = 'red')

    for i in range(n - 1):
        plot([px[i], px[i + 1]], [py[i], py[i + 1]], '-', color = 'green')
        plot([res_x[i], res_x[i + 1]], [res_y[i], res_y[i + 1]], '-', color = 'red')

    plot([px[0], px[n - 1]], [py[0], py[n - 1]], '-', color = 'green', label = 'Before Reflection')
    plot([res_x[0], res_x[n - 1]], [res_y[0], res_y[n - 1]], '-', color = 'red', label = 'After Reflection')
    plot(x, y, color = 'blue', label = 'Mirror Line')

    legend()
    show()
