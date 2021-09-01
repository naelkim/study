
# step06.py with Back-propagation
# 6.1 Variable class 추가 구현
import numpy as np 

class Variable:
    def __init__(self, data):
        self.data = data
        self.grad = None 

# 6.2 Function class 추가 구현

class Function:
    def __call__(self, input):
        x = input.data
        y = self.forward(x)
        output = Variable(y)
        self.input = input # 입력 변수를 기억(보관) 한다.
        return output 

    def forward(self, x):
        raise NotImplementedError()

    def backward(self, gy):
        raise NotImplementedError()



class Square(Function):
    def forward(self, x):
        y = x ** 2
        return y
    
    def backward(self, gy):
        x = self.input.data 
        gx = 2 * x * gy 
        return gx 


class Exp(Function):
    def forward(self, x):
        y = np.exp(x)
        return y 

    def backward(self, gy):
        x = self.input.data
        gx = np.exp(x) * gy 
        return gx 

A = Square()
B = Exp()
C = Square()

x = Variable(np.array(0.5))
a = A(x)
b = B(a)
y = C(b)

y.data # 1.648721270700128

y.grad = np.array(1.0)
b.grad = C.backward(y.grad)
a.grad = B.backward(b.grad)
x.grad = A.backward(a.grad)

print(x.grad) # 3.297442541400256









# step07.py
class Variable:
    def __init__(self, data):
        self.data = data
        self.grad = None
        self.creator = None 

    def set_creator(self, func):
        self.creator = func


class Function:
    def __call__(self, input):
        x = input.data
        y = self.forward(x)
        output = Variable(y)
        output.set_creator(self) # 출력 변수에 창조자를 설정한다.
        self.input = input
        self.output = output # 출력도 저장한다. 
        return output

class Square(Function):
    def forward(self, x):
        y = x ** 2
        return y
    
    def backward(self, gy):
        x = self.input.data 
        gx = 2 * x * gy 
        return gx 


class Exp(Function):
    def forward(self, x):
        y = np.exp(x)
        return y 

    def backward(self, gy):
        x = self.input.data
        gx = np.exp(x) * gy 
        return gx 

A = Square()
B = Exp()
C = Square()

x = Variable(np.array(0.5))
a = A(x)
b = B(a)
y = C(b)

assert y.creator == C
assert y.creator.input == b 
assert y.creator.input.creator == B 
assert y.creator.input.creator.input == a 
assert y.creator.input.creator.input.creator == A 
assert y.creator.input.creator.input.creator.input == x

# 7.2 back-propagation
y.grad = np.array(1.0)

C = y.creator 
b = C.input 
b.grad = C.backward(y.grad)


B = b.creator
a = B.input 
a.grad = B.backward(b.grad)

A = a.creator
x = A.input 
x.grad = A.backward(a.grad)

x.grad # 3.297442541400256

# 7.3 backward method
class Variable:
    def __init__(self, data):
        self.data = data
        self.grad = None 
        self.creator = None 

    def set_creator(self, func):
        self.creator = func 

    def backward(self):
        f = self.creator # 1. 함수를 가져온다. 
        if f is not None:
            x = f.input # 2. 함수의 입력값을 가져온다.
            x.grad = f.backward(self.grad) # 3. 함수의 backward 메서드를 호출한다.
            x.backward()


A = Square()
B = Exp()
C = Square()

x = Variable(np.array(0.5))
a = A(x)
b = B(a)
y = C(b)

y.grad = np.array(1.0)
y.backward()
print(x.grad)










# step08.py
# 8.2 반복문을 이용한 구현

class Variable:
    def __init__(self, data):
        self.data = data
        self.grad = None 
        self.creator = None 

    def set_creator(self, func):
        self.creator = func 

    def backward(self):
        funcs = [self.creator]
        while funcs:
            f = funcs.pop()
            x, y = f.input, f.output
            x.grad = f.backward(y.grad)

            if x.creator is not None:
                funcs.append(x.creator)


# 8.3 동작 확인
A = Square()
B = Exp()
C = Square()

x = Variable(np.array(0.5))
a = A(x)
b = B(a)
y = C(b)

y.grad = np.array(1.0)
y.backward()
print(x.grad)






# step09.py
# 9.1 use python function

x = Variable(np.array(1.0))
f = Square()
y = f(x)


def square(x):
    f = Square()
    return f(x)

def exp(x):
    f = Exp()
    return f(x)

def square(x):
    return Square()(x)

def exp(x):
    return Exp()(x)


x = Variable(np.array(0.5))
a = square(x)
b = exp(a)
y = square(b)

y.grad = np.array(1.0)
y.backward()
print(x.grad) # 3.2974425414


x = Variable(np.array(0.5))
y = square(exp(square(x)))
y.grad = np.array(1.0)
y.backward()
print(x.grad) # 3.2974425414



# 9.2 backward method 간소화
class Variable:
    def __init__(self, data):
        self.data = data
        self.grad = None
        self.creator = None 

    def set_creator(self, func):
        self.creator = func 

    def backward(self):
        if self.grad is None:
            self.grad = np.ones_like(self.data)

        funcs = [self.creator]
        while funcs:
            f = funcs.pop()
            x, y = f.input, f.output 
            x.grad = f.backward(y.grad)

            if x.creator is not None:
                funcs.append(x.creator)


# 9.3 ndarray만 취급하기.
class Variable:
    def __init__(self, data):
        if data is not None:
            if not isinstance(data, np.ndarray):
                raise TypeError('{}은(는) 지원하지 않습니다.'.format(type(data)))

            self.data = data 
            self.grad = None 
            self.creator = None 

x = Variable(np.array(1.0)) # ok
x = Variable(None) # ok 
x = Variable(1.0) # error 



# type을 지정해주게되면 문제가 발생한다. 
# 두 경우를 보면 아래의 경우 x**2를 해버리면 float64 가 되어 버린다. 
x = np.array([1.0])
y = x ** 2
print(type(x), x.ndim)
print(type(y))


x = np.array(1.0)
y = x ** 2
print(type(x), x.ndim)
print(type(y))



def as_array(x):
    if np.isscalar(x):
        return np.array(x)
    return x 

np.isscalar(np.float64(1.0)) # True

np.isscalar(2.0) # True

np.isscalar(np.array(1.0)) # False 

np.isscalar(np.array([1, 2, 3])) # False 

# as_array function은 입력이 scalar 인 경우 ndarray instance로 바꿔주는 함수다. 

class Function:
    def __call__(self, input):
        x = input.data
        y = self.forward(x)
        output = Variable(as_array(y))
        output.set_creator(self)
        self.input = input 
        self.output = output 
        return output 