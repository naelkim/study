odd = [1, 3, 5, 7, 9]

a = []

b = [1, 2, 3]

c = ['Life', 'is', 'too', 'short']

d = [1, 2, 'Life', 'is']

e = [1, 2, ['Life, is']]


a = [1, 2, 3]

a[0] # 1

a[0] + a[2] # 4

a[-1] # 3

a = [1, 2, 3, ['a', 'b', 'c']]

a[0] # 1

a[-1] # ['a','b','c']

a[3] # ['a','b','c']

a[-1][1] # 'b'

a[-1][2] # 'c'

a = '12345'

a[:2] # 12

a = [1, 2, 3, 4, 5]

b = a[:2] # [1, 2]

c = a[2:] # [3, 4, 5]



# add, mul
a = [1, 2, 3]

b = [4, 5, 6]

a + b
# [1, 2, 3, 4, 5, 6]

a * 3
# [1, 2, 3, 1, 2, 3, 1, 2, 3]

len(a) # 3

# list function
a [1, 2, 3]
a.append(4)
# [1, 2, 3, 4]


a = [1, 4, 3, 2]
a.sort()
a
# 1, 2, 3, 4

# sort() != sorted()

a = [1, 4, 3, 2]
sorted(a)


# reverse() != reversed()
# reverse == in place
list(reversed(a))
a.index(3)

a = [1, 4, 3, 2]
a.index(3)
a[2]

type(a.index(3)) == type(a[2])

# insert
a.insert(0,4)
[4, 1, 4, 3, 2]

# remove / 첫 번째 index가 삭제된다
a = [1, 2, 3, 1, 2, 3]
a.remove(3)
# [1, 2, 1, 2, 3]

# pop 맨 마지막 요소를 끄집어 내고 마지막 요소는 삭제한다.
a = [1, 2, 3]
a.pop()
# 3

# a = [1, 2]


# append != extend
a = [1, 2, 3]
a.extend([4, 5])
# [1, 2, 3, 4, 5]

b = [6, 7]
a.extend(b)
# [1, 2, 3, 4, 5, 6, 7]


