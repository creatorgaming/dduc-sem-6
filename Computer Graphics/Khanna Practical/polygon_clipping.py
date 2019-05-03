print('Note: Please input all points in clock-wise order')
print('(starting from bottom left point)\n')
n = int(input('Number of Points in Window: '))
p, px, py = [], [], []
print('\nWindow:\n')
for i in range(n):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    px.append(x)
    py.append(y)
    p.append((x, y))

m = int(input('Number of Points in Object: '))
obj, objx, objy = [], [], []
print('\nObject:\n')
for i in range(m):
    x, y = map(int, input('Point {}: '.format(i + 1)).split())
    objx.append(x)
    objy.append(y)
    obj.append((x, y))
print()

def intersect(p1, p2, w1, w2):
    q = (p1[0] - p2[0]) * (w1[1] - w2[1]) - (p1[1] - p2[1]) * (w1[0] - w2[0])
    x = (p1[0] * p2[1] - p1[1] * p2[0]) * (w1[0] - w2[0]) - (w1[0] * w2[1] - w1[1] * w2[0]) * (p1[0] - p2[0])
    y = (p1[0] * p2[1] - p1[1] * p2[0]) * (w1[1] - w2[1]) - (w1[0] * w2[1] - w1[1] * w2[0]) * (p1[1] - p2[1])
    return (x / q, y / q)

def inside(p1, p2, w):
    return (p2[0] - p1[0]) * (w[1] - p1[1]) - (p2[1] - p1[1]) * (w[0] - p1[0])

res, res_n = obj + [], m
for i in range(n):
    j = (i + 1) % n
    temp = []
    for x in range(res_n):
        y = (x + 1) % res_n
        f_in = inside(p[i], p[j], res[x])
        l_in = inside(p[i], p[j], res[y])

        # Points once entered will get discarded if some other line
        # of clipping window polygon creates problem, so need to worry.
        # Our algorithm is generic enough!

        # Both points inside the window
        if f_in < 0 and l_in < 0:
            # Add only second point, to maintain clock wise cyclic nature
            temp.append(res[y])
        # First point is outside, second is inside (sure intersection)
        elif f_in >= 0 and l_in < 0:
            # Add intersection point and second point
            temp.append(intersect(p[i], p[j], res[x], res[y]))
            temp.append(res[y])
        # Second point is outside, first is inside (sure intersection)
        elif f_in < 0 and l_in >= 0:
            # Add point of intersection only, remember, we are giving more
            # importance to the second point (or regions close to it), just to maintain
            # the cyclic nature. We could have done the same with the first, but then we would
            # have been maintaining an anti-clock-wise order. According to actual algorithm,
            # we do it clock-wise only.
            temp.append(intersect(p[i], p[j], res[x], res[y]))
        # Both points outside, no one added
        else:
            pass

    res = temp
    res_n = len(res)

res_x, res_y = [], []
print('\nPoints of Clipped Polygon:\n')
for xx in res:
    res_x.append(xx[0])
    res_y.append(xx[1])
    print('({:.2f}, {:.2f})'.format(res_x[-1], res_y[-1]))
print()

from sys import argv
if len(argv) == 2 and argv[1] == 'draw':
    from matplotlib.pyplot import xlabel, ylabel, plot, legend, show, subplots
    from matplotlib.patches import Polygon

    fig, ax = subplots()
    fig.canvas.set_window_title('Sutherland Hodgman Polygon Clipping')
    xlabel('X - Axis')
    ylabel('Y - Axis')

    for i in range(m - 1):
        plot([objx[i], objx[i + 1]], [objy[i], objy[i + 1]], '--', color = 'red')
    plot([objx[0], objx[m - 1]], [objy[0], objy[m - 1]], '--', color = 'red', label = 'Clipped Polygon')

    plot(px, py, 'o', color = 'green')
    plot(res_x, res_y, 'o', color = 'green')

    for i in range(n - 1):
        plot([px[i], px[i + 1]], [py[i], py[i + 1]], '-', color = 'green')

    for i in range(res_n - 1):
        plot([res_x[i], res_x[i + 1]], [res_y[i], res_y[i + 1]], '-', color = 'green')

    plot([px[0], px[n - 1]], [py[0], py[n - 1]], '-', color = 'green', label = 'Clipping Window')
    plot([res_x[0], res_x[res_n - 1]], [res_y[0], res_y[res_n - 1]], '-', color = 'green')

    poly = Polygon(res, color = 'green', label = 'Visible Region')
    ax.add_patch(poly)

    legend()
    show()
