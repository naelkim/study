# Q1
score = [80, 75, 55]

def mean_score(score):
    result = sum(score) / len(score)
    return result 

mean_score(score)


# Q2
num = 13
if num % 2 == 0 :
    print('num is even number')
else:
    print('num is odd number ')


# Q3
pin = "881120-1068234"
yyyymmdd = pin[:6]
num = pin[7:]
print(yyyymmdd)
print(num)


# Q4
pin = "881120-1068234"
print(pin[7])


pin = "881120-1068234"
sex_index = pin.index('-') + 1
print( pin[sex_index] )


# Q5
a = "a:b:c:d"
b = a.replace(':','#')
print(b)



# Q6
a = [1,3, 5, 4, 2]
a.sort()
a.reverse()
print(a)



a = [1,3, 5, 4, 2]




# Q7
a = ['Life', 'is', 'too', 'short']
result = ' '.join(a)
result


# Q8
a = (1, 2, 3)
a += (4,)
a


# Q9
a = dict()
# a[[1]] = 'python'


# Q10
a = {'A' : 90, 'B' : 80, 'C' : 70}
result = a.pop('B')
print(a)
print(result)



# Q11
a = [1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 5]
aSet = set(a)
aSet
b = list(aSet)
b



# Q12
a = b = [1, 2, 3]
a[1] = 4
print(b)


# Q : a가 하나라도 포함되어 있으면 출력하고, 전체 a의 갯수를 구해라
# use append(), for

q1 = ('a', 'b', 'e','ad','ef','aaa','aa','eead')
count = 0
a_list = []
for i in q1:
    if 'a' in i:
        a_list.append(i)
        count += 1
    else:
        print('not include a : ', i)
print(f'count : {count}')
print(a_list)


# a_list 안에 있는 a를 count
result = []
for index in a_list:
    if len(index) != 0:
        for j in index:
            result.append(j)
result.count('a')




# Q : 각 단어들을 count해서 알파벳은 key, 갯수는 value로 dictionary 를 만들어라.
# use set, Dictionary, count(), for loop
s = 'mississippi' 

# 1
dic = {}

for i in s:
    dic[i] = s.count(i)
    dic    

# 2
dic = {}
s_set = set(s)
for i, value in enumerate(s_set):
    dic[value] = s.count(value)
    print(dic)


# 3
dic = {}
s_set = set(s)
s_list = list(s_set)

for i in s_list:
    dic[i] = s.count(i)
    dic