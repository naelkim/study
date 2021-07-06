def add(a, b):
    return a + b

a = 3
b = 4
c = add(a, b)
print(c)
# 7


print(add(a, b))
# 7


def add(a, b):
    result = a + b
    return result

a = add(3, 4)
print(a)
# 7


def say():
    return 'Hi'

a = say()
print(a)
# Hi


def add(a, b):
    print("%d, %d의 합은 %d입니다." % (a, b, a + b))

add(3, 4)
# 3, 4의 합은 7입니다.


def add(a, b):
    return a + b

result = add(a = 3, b = 7)
print(result)
# 10

result = add(b = 5, a = 3)
print(result)
# 8


# *args 는 입력값을 모두 모아서 tuple로 반환해주는 것이다. 
def add_many(*args):
    result = 0 
    for i in args:
        result = result + i
    result = result

result = add_many(1, 2, 3)
print(result)
# 6

result = add_many(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(result)
# 55

def add_mul(choice, *args):
    if choice == "add":
        result = 0 
        for i in args:
            result = result + 1
    elif choice == "mul":
        result = 1
        for i in args:
            result = result * i 
    return result

result = add_mul('add', 1,2,3,4,5)
print(result)
# 15

result = add_mul('mul', 1, 2, 3 , 4, 5)
print(result)
# 120



def print_kwargs(**kwargs):
    print(kwargs)

print_kwargs(a = 1)
# {'a': 1}


print_kwargs(name = 'foo', age = 3)
# {'name': 'foo', 'age': 3}


# **prams : key, value 값으로 dict형태로 만들어준다


def add_and_mul(a, b):
    return a+b, a*b

result = add_and_mul(3, 4)
# tuple로 값이 출력된다.


def say_nick(nick):
    if nick == '바보':
        return
    print("나의 별명은 %s입니다." % nick)

say_nick('야호')
# 나의 별명은 야호입니다.

a = 1
def vartest(a):
    a += 1

vartest(a)
print(a)
# function 내에서만 적용이 된다.

a = 1
def vartest():
    global a
    a = a + 1

vartest()
print(a)


# lambda 
add = lambda a,b : a + b
result = add(3, 4)

print(result)
# 7 

