h, k, r = map(int, input('Enter Center and Radius of Circle: ').split())
x, y, real_x, real_y, x_cor, y_cor = [], [], [], [], r, 0

def dist(x):
    return abs(x * x + y_cor * y_cor - r * r)

from math import sqrt

while x_cor >= y_cor:
    real = sqrt(r * r - y_cor * y_cor)

    x.append(h + x_cor)
    x.append(h + x_cor)
    x.append(h - x_cor)
    x.append(h - x_cor)
    x.append(h + y_cor)
    x.append(h + y_cor)
    x.append(h - y_cor)
    x.append(h - y_cor)

    y.append(k + y_cor)
    y.append(k - y_cor)
    y.append(k + y_cor)
    y.append(k - y_cor)
    y.append(k + x_cor)
    y.append(k - x_cor)
    y.append(k + x_cor)
    y.append(k - x_cor)

    real_x.append(h + real)
    real_x.append(h + real)
    real_x.append(h - real)
    real_x.append(h - real)
    real_x.append(h + y_cor)
    real_x.append(h + y_cor)
    real_x.append(h - y_cor)
    real_x.append(h - y_cor)

    real_y.append(k + y_cor)
    real_y.append(k - y_cor)
    real_y.append(k + y_cor)
    real_y.append(k - y_cor)
    real_y.append(k + real)
    real_y.append(k - real)
    real_y.append(k + real)
    real_y.append(k - real)

    y_cor += 1
    if dist(x_cor - 1) < dist(x_cor):
        x_cor -= 1

print('\nPoints on the Circle:\n')
for i in range(len(x)):
    print('({}, {})'.format(x[i], y[i]))
print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend
    gcf().canvas.set_window_title('Mid Point Circle Algorithm')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(x, y, 's', label = 'Plotted Pixels')
    plot(real_x, real_y, '.', label = 'Original Circle')

    legend()
    show()
