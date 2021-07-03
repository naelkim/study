# 2.3.1 Perceptron
def AND(x1, x2):
    w1, w2, threshold = 0.5, 0.5, 0.7
    tmp = w1*x1 + w2*x2
    if tmp <= threshold :
        return 0
    else:
        return 1

AND(0,0) # 0
AND(1,0) # 0
AND(0,1) # 0
AND(1,1) # 1


# 2.3.2 weight _ bias

import numpy as np
x = np.array([0, 1])
w = np.array([0.5, 0.5])
b = -0.7

y = np.sum(w*x) + b
y # -0.19999999999999996



def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1


def NAND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([-0.5, -0.5])
    b = 0.7

    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1



def OR(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.2
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1


# XOR 
def XOR(x1, x2):
    s1 = NAND(x1, x2)
    s2 = OR(x1, x2)
    y = AND(s1, s2)
    return y


XOR(0, 0) # 0
XOR(1, 0) # 1
XOR(0, 1) # 1
XOR(1, 1) # 0