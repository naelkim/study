# tuple
t1 = ()

t2 = (1,)

t3 = (1, 2, 3)

# 괄호를 생략해도 무방
t4 = 1, 2, 3

t5 = ('a', 'b', ('ab', 'cd'))

t1, t2, t3, t4, t5

# list 의 값은 변경이 가능하지만 tuple의 값은 변경이 불가능하다.

# 지우는 것이 불가능
t1 = 1, 2, 'a', 'b'

del t1[0] # error

# 변경 불가능
t1[0] = 'c' # error

# indexing
t1 = 1, 2, 'a', 'b'

t1[0] # 1

a = ((1 ,2) , (3,4), (5,9))

a[:][1] # (3, 4)

# slicing
t1[:-1] # (1, 2, 'a')

t1[1:-1] # (2, 'a')

a[0][:] # (1, 2)

a[:-1][:] # ((1, 2), (3, 4))

# add
t2 = (3,4)

t1 + t2 # (1, 2, 'a', 'b', 3, 4)

# multiple
t2 * 3 # (3, 4, 3, 4, 3, 4)

t1 * 3 # (1, 2, 'a', 'b', 1, 2, 'a', 'b', 1, 2, 'a', 'b')

# length of tuple
len(t1)

# type
type(t1) # <class 'tuple'>

# ,를 해주지 않으면 tuple 형태가 되지 않는다.
h1 = (150)
type(h1) # <class 'int'>

h2 = (150,) 
type(h2) # <class 'tuple'>

# tuple packing
information = '홍길동', 'cs', 'Seoul', 4
name, major, live, family = information
print('name : {0}, major : {1}, live : {2}, family : {3} '.format(name, major, live, family))

# for

for i in t1:
    print(i)

# while
t1
i = 0
n = 0
while i <=5:
    for j in t1: # len(t1) == 4
        print(j)
        n += 1
    i += 1
print('{0:.4f}'.format(i)) # 6
print('%.4f' %n ) # 24 \d : int, \f : float, \s : string,  %o : 8진수, %x : 16진수


# 출력값을 tuple로 반환할 수 있다.
h = [7,5,2,1,11,15,55]
def minmax(tuple):
    return min(tuple), max(tuple)

minmax(h)
