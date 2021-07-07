# 수치적 미분

def numerical_diff(f, x):
    h = 1e-4
    return (f(x + h) - f(x - h)) / 2*h

def function_1(x):
    return 0.01*x**2 + 0.1*x

import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0.0, 20.0, 0.1)
y = function_1(x)
plt.xlabel('x')
plt.ylabel('y')
plt.plot(x, y)
plt.plot(x)
plt.show()


# partial 

def function_2(x):
    return x[0]**2 + x[1]**2


x1 = np.arange(-3.0, 3.0, 0.1)
x2 = np.arange(-3.0, 3.0, 0.1)
z = function_2(x1,x2)
fig = plt.figure()
ax = fig.gca(projection ='3d')

ax.scatter(x1, x2, z)
plt.show()





# slope 
def numerical_gradient(f, x):
    h = 1e-4
    grad = np.zeros_like(x)

    for idx in range(x.size):
        tmp_val = x[idx]

        x[idx] = tmp_val + h
        fxh1 = f(x)

        x[idx] = tmp_val - h
        fxh2 = f(x)

        grad[idx] = (fxh1 - fxh2) / (2*h)
        x[idx] = tmp_val

    return grad


numerical_gradient(function_2, np.array([3.0, 4.0]))
# array([6., 8.])

