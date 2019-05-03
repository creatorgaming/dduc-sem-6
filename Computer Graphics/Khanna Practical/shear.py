print('Note: Please input all points in proper sequence')
n = int(input('Number of Points in Object: '))
px, py, p = [], [], []
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))

dir, lam = input('Shear (X or Y) (Shear Constant): ').split()

def bad(c):
    try:
        float(c)
        return False
    except:
        return True

if dir != 'x' and dir != 'X' and dir != 'y' and dir != 'Y' or bad(lam):
    exit('\nBad Shear!\n')

x, y = (0.0, float(lam)) if dir == 'x' or dir == 'X' else (float(lam), 0.0)
print('\nPoints after Shearing:\n')
res_x, res_y = [], []

for xx in p:
    res_x.append(xx[0] + y * xx[1])
    res_y.append(xx[1] + x * xx[0])
    print('({:.2f}, {:.2f})'.format(res_x[-1], res_y[-1]))
print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import gcf, xlabel, ylabel, plot, show, legend
    gcf().canvas.set_window_title('2D Shearing on an Object')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    plot(px, py, 'o', color = 'green')
    plot(res_x, res_y, 'o', color = 'red')

    for i in range(n - 1):
        plot([px[i], px[i + 1]], [py[i], py[i + 1]], '-', color = 'green')
        plot([res_x[i], res_x[i + 1]], [res_y[i], res_y[i + 1]], '-', color = 'red')

    plot([px[0], px[n - 1]], [py[0], py[n - 1]], '-', color = 'green', label = 'Before Shearing')
    plot([res_x[0], res_x[n - 1]], [res_y[0], res_y[n - 1]], '-', color = 'red', label = 'After Shearing')

    legend()
    show()
