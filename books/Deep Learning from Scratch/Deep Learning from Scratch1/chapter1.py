# 1.3.2 data type

type(10)
# <class 'int'>

type(2.718)
# <class 'float'>

type('hello world')
# <class 'str'>



# 1.3.3 variable 
x = 10 
print(x)
# 10 

x = 100 
print(x)
100

y = 3.14

x * y
# 314.0

type (x * y)
# <class 'float'>



# 1.3.4 list
a = [1, 2, 3, 4, 5]
print(a)
# [1, 2, 3, 4, 5]

len(a)
# 5

a[4]
# 5

a[4] = 99
print(a)
# [1, 2, 3, 4, 99]

a[0:2]
# [1, 2]

a[1:]
# [2, 3, 4, 99]

a[:3]
# [1, 2, 3]

a[:-1]
# [1, 2, 3, 4]

a[:-2]
# [1, 2, 3]


# 1.3.5 Dictionary
me = {'height' : 180}
me['height']
# 180

me['weight'] = 70
print(me)
# {'height': 180, 'weight': 70}

# 1.3.6 bool
hungry = True
sleepy = False
type(hungry)
# <class 'bool'>

not hungry
# False

hungry and sleepy
# False 

hungry or sleepy
#True 



# 1.3.7 if 문
hungry = True
if hungry:
    print("I'm hungry")
# I'm hungry

hungry = False
if hungry:
    print("I'm hungry")
else:
    print("I'm not hungry")
    print("I'm sleepy")
# I'm not hungry
# I'm sleepy

