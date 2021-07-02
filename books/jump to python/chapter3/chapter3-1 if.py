money = True
if money:
    print("택시를 타고 가라")
else:
    print("걸어 가라")

# x < y
# x > y
# x == y
# x!= y
# x >= y
# x <= y 

x, y = 3, 2
x > y
# True

x < y
# False

x != y
# True

money = 2000
if money >= 3000:
    print("택시를 타고 가라")
else:
    print("걸어 가라")

# 걸어가라

# x or y
# x and y
# not x

money = 2000
card = True
if money >= 3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어 가라")

# 택시를 타고 가라

# x in list
# x in tuple
# x in string

'a' in ('a','b','c')
# True

'j' not in 'python'
# True

pocket = ['paper', 'cellphone', 'money']
if 'money' in pocket:
    print('택시를 타고 가라')
else:
    print('걸어 가라')

pocket = ['paper', 'cellphone', 'money']
if 'money' in pocket:
    pass
else:
    print('카드를 꺼내라')

pocket = ['paper', 'cellphone']
card = True
if 'money' in pocket:
    print('택시를 타고 가라')
else:
    if card:
        print('택시를 타고 가라')
    else:
        print('걸어 가라')

# 택시를 타고 가라


pocket = ['paper', 'cellphone']
card = True
if 'money' in pocket:
    print('택시를 타고 가라')
elif card:
    print('택시를 타고 가라')
else:
    print('걸어 가라')

# 택시를 타고 가라


if 'money' in pocket:
    pass
else:
    print("카드를 꺼내라")

pocket = ['paper', 'money', 'cellphone']
if 'money' in pocket: pass
else: print('카드를 꺼내라')

score = 50
if score >= 60:
    message = "success"
else:
    message = "failure"

message = 'success' if score >= 60 else message = 'faulure'