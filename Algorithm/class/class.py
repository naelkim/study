
# add function
result = 0

def add(num):
    global result
    result += num
    return result

print(add(3)) # 3

print(add(4)) # 7

result1 = 0
result2 = 0


# 각각의 함수에는 영향을 끼치지 않는다.
def add1(num):
    global result1
    result1 += num
    return result1

def add2(num):
    global result2
    result2 += num
    return result2

print(add1(3)) # 3

print(add1(4)) # 7

print(add2(3)) # 3

print(add2(7)) # 10


class Calculator:
    def __init__(self):
        self.result = 0

    def add(self,num):
        self.result += num
        return self.result

cal1 = Calculator()
cal2 = Calculator()

print(cal1.add(3)) # 3
print(cal1.add(4)) # 7

print(cal2.add(3)) # 3
print(cal2.add(7)) # 10

def sub(self, num):
    self.result -= num
    return self.result

class calcul:
    def __init__(self, first, second, method):
        self.first = first
        self.second = second
        self.method = method
    def setdata(self, first, second):
        self.first = first
        self.second = second
    def add(self):
        result = self.first + self.second
        return result
    def mul(self):
        result = self.first * self.second
        return result
    def div(self):
        result = self.first / self.second
        if self.method == 'int':
            return int(result)
        else:
            return result
    def sub(self):
        result = self.first - self.second
        return result
a = calcul()
a.setdata(4,2)
a.add()
a.sub()
a = calcul(4, 2, 'int')
a.div()
a.div()
a.mul()


# __init__ 을 사용하게 되면 바로 호출된다.


# class 상속
class Morecal(calcul):
    pass

a = 1
int(a)


import mod1

mod1.add(4,1)

from mod2 import Math
PI = 3.141592
a = Math()
a.sol(4)

