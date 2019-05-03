x1, y1, x2, y2 = map(int, input('Enter Space Separated Coordinates: ').split())
x, y, real_y = [], [], []

if y1 == y2:
    for x_cor in range(min(x1, x2), max(x1, x2) + 1):
        x.append(x_cor)
        y.append(y1)
        real_y.append(y1)
elif x1 == x2:
    for y_cor in range(min(y1, y2), max(y1, y2) + 1):
        y.append(y_cor)
        real_y.append(y_cor)
        x.append(x1)
else:
    if x1 < x2:
        x.append(x1)
        y.append(y1)
        real_y.append(y1)
    else:
        x.append(x2)
        y.append(y2)
        real_y.append(y1)

    slope = (y1 - y2) / (x1 - x2)

    def approx(x):
        neg = x < 0.0
        x = -x if neg else x
        a = int(x)
        b = x - a
        a = a if b < 0.5 else a + 1
        return -a if neg else a

    for x_cor in range(abs(x2 - x1)):
        x.append(x[-1] + 1)
        y_cor = (x[-1] - x1) * slope + y1
        real_y.append(y_cor)
        y.append(approx(y_cor))

print('\nPoints on the Line:\n')

for i in range(len(x)):
    print('({}, {})'.format(x[i], y[i]))
print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend
    gcf().canvas.set_window_title('Mid Point Line Algorithm')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(x, y, 's', label = 'Plotted Pixels')
    plot(x, real_y, label = 'Original Line')

    legend()
    show()
