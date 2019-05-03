print('Note: Please input all points in proper sequence')
n = int(input('Number of Points in Object: '))
px, py, p = [], [], []
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))

x, y = map(int, input('Enter Translation Distances: ').split())
print('\nPoints after Translation:\n')
res_x, res_y = [], []

for xx in p:
    res_x.append(xx[0] + x)
    res_y.append(xx[1] + y)
    print('({}, {})'.format(res_x[-1], res_y[-1]))
print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend
    gcf().canvas.set_window_title('2D Translation on an Object')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(px, py, 'o', color = 'green')
    plot(res_x, res_y, 'o', color = 'red')

    for i in range(n - 1):
        plot([px[i], px[i + 1]], [py[i], py[i + 1]], '-', color = 'green')
        plot([res_x[i], res_x[i + 1]], [res_y[i], res_y[i + 1]], '-', color = 'red')

    plot([px[0], px[n - 1]], [py[0], py[n - 1]], '-', color = 'green', label = 'Before Translation')
    plot([res_x[0], res_x[n - 1]], [res_y[0], res_y[n - 1]], '-', color = 'red', label = 'After Translation')

    legend()
    show()
