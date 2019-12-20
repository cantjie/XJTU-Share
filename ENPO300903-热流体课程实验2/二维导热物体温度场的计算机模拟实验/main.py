# python main.py            # 恒温边界
# python main.py convection # 对流边界

import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import sys

X = np.arange(0, 16)
Y = np.arange(0, 12)
X, Y = np.meshgrid(Y, X)
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
# ax = fig.gca(projection='3d')
t = np.zeros((16, 12))


conduction = True
for i in sys.argv:
    if i == 'convection':
        conduction = False
        break

h1 = 10.6
lam = 0.53
dx = 0.1
lambda_over_dx = lam / dx
h2 = 3.975

if conduction:
    t1 = 30
    t2 = 0
    t[0, :] = t1
    t[:, 0] = t1
    t[5:16, 5:12] = t2
else:
    t1 = 30
    t2 = 10
    t[0, :] = t1
    t[:, 0] = t1
    t[5:16, 5:12] = t2

if conduction:
    for k in range(0, 1000):

        for m in range(1, 5):
            for n in range(1, 11):
                t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] + t[m, n + 1]) / 4

            n = 11
            t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] * 2) / 4

        for m in range(5, 15):
            for n in range(1, 5):
                t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] + t[m, n + 1]) / 4

        m = 15
        for n in range(1, 5):
            t[m, n] = (t[m - 1, n] * 2 + t[m, n - 1] + t[m, n + 1]) / 4

else:
    for k in range(0, 1000):

        # m = 0
        m = 0
        n = 0
        t[m, n] = (h1 * t1 + lambda_over_dx * (t[m + 1, n] / 2 + t[m, n + 1] / 2)) / (h1 + lambda_over_dx)

        for n in range(1, 11):
            t[m, n] = (h1 * t1 + lambda_over_dx * (t[m + 1, n] + t[m, n - 1] / 2 + t[m, n + 1] / 2)) / (h1 + lambda_over_dx * 2)

        n = 11
        t[m, n] = (h1 * t1 / 2 + lambda_over_dx * (t[m + 1, n] / 2 + t[m, n - 1] / 2)) / (h1 / 2 + lambda_over_dx)

        # m = 1 .. 4
        for m in range(1, 5):
            n = 0
            t[m, n] = (h1 * t1 + lambda_over_dx * (t[m - 1, n] / 2 + t[m + 1, n] / 2 + t[m, n + 1])) / (h1 + lambda_over_dx * 2)

            for n in range(1, 11):
                t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] + t[m, n + 1]) / 4

            n = 11
            t[m, n] = (t[m - 1, n] / 2 + t[m + 1, n] / 2 + t[m, n - 1]) / 2

        # m = 5
        m = 5
        n = 0
        t[m, n] = (h1 * t1 + lambda_over_dx * (t[m - 1, n] / 2 + t[m + 1, n] / 2 + t[m, n + 1])) / (h1 + lambda_over_dx * 2)

        for n in range(1, 5):
            t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] + t[m, n + 1]) / 4

        n = 5
        t[m, n] = (h2 * t2 + lambda_over_dx * (t[m - 1, n] + t[m + 1, n] / 2 + t[m, n - 1] + t[m, n + 1] / 2)) / (h2 + lambda_over_dx * 3)

        for n in range(6, 11):
            t[m, n] = (h2 * t2 + lambda_over_dx * (t[m - 1, n] + t[m, n - 1] / 2 + t[m, n + 1] / 2)) / (h2 + lambda_over_dx * 2)

        n = 11
        t[m, n] = (h2 * t2 / 2 + lambda_over_dx * (t[m - 1, n] / 2 + t[m, n - 1] / 2)) / (h2 / 2 + lambda_over_dx)

        # m = 6 .. 14
        for m in range(6, 15):
            n = 0
            t[m, n] = (h1 * t1 + lambda_over_dx * (t[m - 1, n] / 2 + t[m + 1, n] / 2 + t[m, n + 1])) / (h1 + lambda_over_dx * 2)

            for n in range(1, 5):
                t[m, n] = (t[m - 1, n] + t[m + 1, n] + t[m, n - 1] + t[m, n + 1]) / 4

            n = 5
            t[m, n] = (h2 * t2 + lambda_over_dx * (t[m - 1, n] / 2 + t[m + 1, n] / 2 + t[m, n - 1])) / (h2 + lambda_over_dx * 2)

        # m = 15
        m = 15
        n = 0
        t[m, n] = (h1 * t1 / 2 + lambda_over_dx * (t[m - 1, n] / 2 + t[m, n + 1] / 2)) / (h1 / 2 + lambda_over_dx)

        for n in range(1, 5):
            t[m, n] = (t[m - 1, n] + t[m, n - 1] / 2 + t[m, n + 1] / 2) / 2

        n = 5
        t[m, n] = (h2 * t2 / 2 + lambda_over_dx * (t[m - 1, n] / 2 + t[m, n - 1] / 2)) / (h2 / 2 + lambda_over_dx)

# surf = ax.plot_surface(X, Y, t, cmap=cm.coolwarm, linewidth=0, antialiased=False)
ax.pcolormesh(X, Y, t, cmap=cm.coolwarm)
if conduction:
    ax.contour(X, Y, t, [12, 18, 24])
else:
    ax.contour(X, Y, t, [18, 22, 26])
plt.show()

t = np.transpose(t)
if conduction:
    np.savetxt("conduction.csv", t, delimiter=",")
else:
    np.savetxt("convection.csv", t, delimiter=",")