# 2.2.string type

"Life is too short, You need Python"

"a"

"123"

"Hello World"

'Python is fun'

"""Life is too short, You need python"""

'''Life is too short, You need python'''

food = "Python's favorite food is perl"


say = '\" Python is very easy. \" he says.'
# '" Python is very easy. " he says.'


multiline = "Life is too short\nYou need python"
# Life is too short 
# You need python

head = "Python"
tail = " is fun!"
head + tail
# 'Python is fun!'

a = 'python'
a * 2
# 'pythonpython'

print("="* 30)
print("My Program")
print("=" * 30)
# ==============================
# >>> print("My Program")
# My Program
# >>> print("=" * 30)
# ==============================


# length
a = "Life is too short"
len(a) # 17

a = "Life is too short, You need Python"
a[3] # e

a[0] # L

a[12] # s

a[-1] # n

a[-0] # L

a[-2] # o

a[-5] # y

b = a[0] + a[1] + a[2] + a[3]
b # Life

# Slicing
a[0:4] # Life

a[0:3] # Lif

a[0:5] # Life

a[0:2] # Li

a[5:7] # is

a[12:17] # short

a[19:] # You need Python

a[:17] # Life is too short

a[:] # Life is too short, You need Python

a[19:-7] # You need 



a = "20010331Rainy"
year = a[:4] # 2001
day = a[4:8] # 0331
weather = a[8:] # Rainy

a = "Pithon"
a[1] = 'y'
# Python

a[:1] + 'y' + a[2:]
# Python


# formating
"I eat %d apples." %3
# 'I eat 3 apples.'

"I eat %s apples." % "five"
# 'I eat five apples.'

number = 3
"I eat %d apples." % number
# 'I eat 3 apples.'

number, day = 10, 'three'
"I ate %d apples. so I was sick for %s days." % (number, day)
# 'I ate 10 apples. so I was sick for three days.'

# %s : String
# %c : Character
# %d : Integer
# %f : floating - point
# %o : 8진수
# %x : 16진수

"I have %s apples." % 3
# 'I have 3 apples.'

"%10s" % "hi"
# '        hi' 오른쪽 정렬 / 전체 길이(10) 중 나머지는 공백으로

"%-10sjane" % 'hi'

"%0.4f" % 3.42134234
# '3.4213'

"{0:<10}".format("hi")
# 'hi        '

"{0:>10}".format("hi")
# '        hi'

"{0:^10}".format("hi")
# '    hi    '

a = 'hobby'
a.count('b')

