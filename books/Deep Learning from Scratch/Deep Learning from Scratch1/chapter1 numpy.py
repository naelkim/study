
import numpy as np
x = np.array([1.0, 2.0, 3.0])
print(x)
type(x)
# <class 'numpy.ndarray'>

x = np.array([1.0, 2.0, 3.0])
y = np.array([2.0, 4.0, 6.0])

x - y
# array([-1., -2., -3.])
x * y
# array([ 2.,  8., 18.])
x / y 
# array([0.5, 0.5, 0.5])

x = np.array([1.0, 2.0, 3.0])
x / 2.0
# array([0.5, 1. , 1.5])

A = np.array([[1, 2], [3, 4]])
print(A)

A.shape
# (2, 2)
A.dtype
# dtype('int32')

B = np.array([[3, 0], [0, 6]])
A + B

A * B


# broadcast  : 스칼라를 곱하더라도 알아서 늘려가지구 곱하기 됨. 1 by 2배열이라면 늘려서 곱해줌
print(A)
A * 10

A = np.array([[1, 2], [3, 4]])
B = np.array([[10, 20]])
A * B

X = np.array([[51, 55], [14, 19], [0, 4]])
print(X)

X[0]
# array([51, 55])

X[0][1]
# 55


for row in X:
    print(row)

# [51 55]
# [14 19]
# [0 4]


# flatten 평평하게 만들어준다 1차원으루
X = X.flatten()
# array([51, 55, 14, 19,  0,  4])


X[np.array([0, 2, 4])] # index가 0, 2, 4인 값들 찾기.
# array([51, 14,  0])

