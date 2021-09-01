
# step01.py
# 1.2 Variable

class Variable:
    def __init__(self, data):
        self.data = data

import numpy as np 

data = np.array(1.0)
x = Variable(data)
print(x.data) # 1.0


x.data = np.array(2.0)
print(x.data)



# 1.3 numpy array

x = np.array(1.0)
x.ndim # 0


x = np.array([1, 2])
x.ndim # 1

x = np.array([
    [1, 2],
    [3, 4]])
x.ndim # 2








# step02.py
# 2.2 function class 구현

class Function:
    def __call__(self, input):
        x = input.data # 데이터를 꺼낸다
        y = x ** 2 # 실제 계산
        output = Variable(y) # Variable 형태로 되돌린다. 
        return output


# 2.3 function class 이용
x = Variable(np.array(10))
f = Function()
y = f(x)
type(y) # <class '__main__.Variable'>
y.data # 100


class Function:
    def __call__(self, input):
        x = input.data
        y = self.forward(x) # 구체적인 계산은 forward에서 한다. 
        output = Variable(y)
        return output

    def forward(self, x):
        raise NotImplementedError()


# Function을 상속받는다.
class Square(Function):
    def forward(self, x):
        return x ** 2

x = Variable(np.array(10))
f = Square()
y = f(x)
type(y) # <class '__main__.Variable'>
y.data









# step03.py
# 3.1 exp 구현
class Exp(Function):
    def forward(self, x):
        return np.exp(x)

# 3.2 함수 연결
A = Square()
B = Exp()

C = Square()

x = Variable(np.array(0.5))
a = A(x)
b = B(a)
y = C(b)
print(y.data) # 1.648721270700128










# step04.py
# numerical differentiation

def numerical_diff(f, x, eps = 1e-4):
    x0 = Variable(x.data - eps)
    x1 = Variable(x.data + eps)
    y0 = f(x0)
    y1 = f(x1)
    output = (y1.data-y0.data) / 2*eps
    return output 


f = Square()
x = Variable(np.array(2.0))
dy = numerical_diff(f, x)
print(dy) # 4.000000000004e-08


# 4.3 합성 함수의 미분
def f(x):
    A = Square()
    B = Exp()
    C = Square()

    return C(B(A(x)))

x = Variable(np.array(0.5))
dy = numerical_diff(f, x)
dy # 3.29744262933307e-08







