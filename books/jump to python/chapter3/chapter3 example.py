
# Q1
a = "Life is too short, you need python"

if 'wife' in a: print('wife')
elif 'python' in 'a' and 'you' not in a: print('python')
elif 'shirt' not in a: print('need')
else: print('none')


# Q2
result = 0
i = 1
while i <= 1000:
    if i % 3 == 0 :
        result += i
    i += 1

print(result) # 166833


# Q3
i = 0
while True:
    i += 1
    if i > 5 : break
    print('*'*i)


# Q4
for i in range(1, 101):
    print(i)



# Q5
A = [70, 60, 55, 75, 95, 90, 80, 80, 85, 100]
total = 0 
for score in A:
    total += score
average = total / len(A)
print(average)


# Q6
numbers = [1, 2, 3, 4, 5]
result = []
for n in numbers:
    if n % 2 == 1:
        result.append(n*2)
result 


numbers = [1, 2, 3, 4, 5]
result = []
result = [n*2 for n in numbers if n % 2 == 1]
result



# Q7 - Q3번 문제와 동일하게 하되, 아래와 같이 출력할 것.
#     *
#    **
#   ***
#  ****
# *****


# 1
i = 0
while True:
    i += 1
    if i > 5 : break
    print(' '*(5-i), '*'*i, sep = '')


# 1
i = 0
while True:
    i += 1
    if i > 5 : break
    print('{0:>5}'.format('*'*i))




# Q8 data 에서 공대인 학과의 수와 공대가 아닌 학과의 수를 구해라 ( count사용 금지 )
# while 사용
data = ['경제학과','생명공학과','기계공학과','수학과','컴퓨터공학과','법학과','통계학과','전자공학과','전기공학과','토목공학과']

def major(data):
    공과대학 = []
    i = 0
    while i < len(data):
        if '공' in data[i]: 
            공과대학.append(data[i])
        i += 1
    return print(f'공과대학 학과의 수 : {len(공과대학)}, 다른 단과대학 학과의 수 : {len(data) - len(공과대학)}')

major(data)


# Q 1
for i in range(15, 0, -3):
    print(i, end = ' ')

# Q 2
a = []
for i in range(1, 6, 2):
    a.append(i)
print(a[0], a[1], a[2])

# Q 3

def solution(A):
    result = 0
    sol = []
    for i in A:
        result += i

    result = result / len(A)

    for j in A:
        if j <= result :
            sol.append(j)
    
    return sol

A = [50, 60, 40, 90, 45]

solution(A)



# Q 4

d1 = list(range(1, 20, 2))
result = []
for i in d1:
    result.append(i % 5)
print(result) 
    



# Q 6
def sosu(number):
    for i in range(2, number):
        if number % i == 0:
            print('소수가 아닙니다.')
            break
        else:
            print('소수입니다.')
            break
    return 

number = int(input())

sosu(number)


# Q 7

arr = [[int(input()) for i in range(2)] for j in range(5)]



# Q 8

a = list(int(input()) for i in range(4))
arr = [
    [a[0], a[0]**2, a[0]**2**2, a[0]**2**2**2],
    a[1], a[1]**2, a[1]**2**2, a[1]**2**2**2,
    a[2], a[2]**2, a[2]**2**2, a[2]**2**2**2,
    a[3], a[3]**2, a[3]**2**2, a[3]**2**2**2 ]


i = 0 
while i<=5:
    arr = [[0 for i in range(4)] for j in range(5)]
    for j in range(4):
        for k in range(5):
            arr[j][k] = arr[j][k]**2
