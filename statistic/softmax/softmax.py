import numpy as np

def softmax(a):
    exp_a = np.exp(a)
    sum_exp_a = np.sum(exp_a)
    y = exp_a / sum_exp_a

    return y
a = np.array([1.0,2.5, 3.8, 4.2])

softmax(a)

a = np.array([[1, 2, 3, 6],
            [2, 4, 5, 6],
            [3, 8, 7, 6]])

softmax(a)