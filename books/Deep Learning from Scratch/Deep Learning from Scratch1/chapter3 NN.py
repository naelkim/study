# 3.2 activate function

# 3.2.2 step function 
def step_function(x):
    if x <= 0 :
        return 0
    else:
        return 1

import numpy as np
# use numpy array 
def step_function(x):
    y = x > 0
    return y.astype(np.int)

x = np.array([-1.0, 1.0, 2.0])
step_function(x)
# array([0, 1, 1])


import numpy as np
import matplotlib.pyplot as plt


x = np.arange(-5.0, 5.0, 0.1)
def step_function(x):
    return np.array( x > 0, dtype = np.int)
y = step_function(x)

plt.plot(x, y,)
plt.ylim(-0.1, 1.1)
plt.show()


# 3.2.4 sigmoid function

def sigmoid_function(x):
    return 1 / ( 1 + np.exp(-x))

x = np.array([-1.0, 1.0, 2.0])
sigmoid_function(x)

x = np.arange(-5.0, 5.0, 0.1)
y = sigmoid_function(x)

plt.plot(x, y)
plt.ylim(-0.1, 1.1)
plt.show()

plt.plot(x, step_function(x), linestyle = '--')
plt.plot(x, sigmoid_function(x))
plt.ylim(-0.1, 1.1)
plt.show()



# ReLU function : Rectified Linear Unit

def ReLU(x):
    return np.max(0, x)


# 3.3 N-dimention

import numpy as np
A = np.array([1, 2, 3, 4])

np.ndim(A)

A.shape


B = np.array([[1, 2], [3, 4], [5, 6]])

np.ndim(B)

B.shape


# matrix mul
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])
np.dot(A,B)



A = np.array([[1, 2, 3], [4, 5, 6]])
B = np.array([[1, 2], [3, 4], [5, 6]])

np.dot(A,B)


X = np.array([1, 2])

W = np.array([[1, 3, 5], [2, 4, 6]])

Y = np.dot(X, W)


X = np.array([1.0, 0.5])
W1 = np.array([
    [0.1, 0.3, 0.5], 
    [0.2, 0.4, 0.6]
    ])

B1 = np.array([0.1, 0.2, 0.3])

A1 = np.dot(X, W1) + B1

A1
# array([0.3, 0.7, 1.1])

Z1 = sigmoid_function(A1)
# array([0.57444252, 0.66818777, 0.75026011])

W2 = np.array([
    [0.1, 0.4],
    [0.2, 0.5],
    [0.3, 0.6]
    ])

B2 = np.array([0.1, 0.2])

A2 = np.dot(Z1, W2) + B2
# array([0.51615984, 1.21402696])

Z2 = sigmoid_function(A2)
# array([0.62624937, 0.7710107 ])

W3 = np.array([
    [0.1, 0.3],
    [0.2, 0.4]
])

B3 = np.array([
    [0.1, 0.2]
])

A3 = np.dot(Z2, W3) + B3
A3





def sigmoid_function(x):
    return 1 / ( 1 + np.exp(-x))

import numpy as np
def init_network():
    network = {}
    network['w1'] = np.array([[0.1, 0.3, 0.5], [0.2, 0.4, 0.6]])
    network['b1'] = np.array([0.1, 0.2, 0.3])
    network['w2'] = np.array([[0.1, 0.4], [0.2, 0.5], [0.3, 0.6]])
    network['b2'] = np.array([0.1, 0.2])
    network['w3'] = np.array([[0.1, 0.3], [0.2, 0.4]])
    network['b3'] = np.array([0.1, 0.2])

    return network


def forward(network, x):
    w1, w2, w3 = network['w1'], network['w2'], network['w3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, w1) + b1
    z1 = sigmoid_function(a1)

    a2 = np.dot(z1, w2) + b2
    z2 = sigmoid_function(a2)

    a3 = np.dot(z2, w3) + b3
    
    return a3

network = init_network()
x = np.array([1.0, 0.5])
y = forward(network, x)
print(y)
