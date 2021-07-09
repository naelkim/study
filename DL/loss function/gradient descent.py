# 수치적으로 GD를 계산

import numpy as np

def eval_numerical_gradient(f, x):
    fx = f(x)
    grad = np.zeros(x.shape)
    h = 0.00001

    it = np.nditer(x, flags = ['multi_index'], op_flags = ['readwrite'])
    while not it.finished:
        ix = it.multi_index
        old_value = x[ix]
        x[ix]= old_value + h
        fxh = f(x)
        x[ix] = old_value

        grad[ix] = (fxh - fx) / h
        it.iternext()

    return grad
