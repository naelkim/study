f = open('새파일.txt', 'w')
f.close()


# r : 읽기 모드 : 파일을 읽기만 할 때 사용
# w : 쓰기 모드 : 파일에 내용을 쓸 때 사용
# a : 추가 모드 : 파일의 마지막에 새로운 내용을 추가할 때 사용


f = open("C:/doit/새파일.txt", 'w')
f.close()


f = open("C:/doti/새파일.txt", 'w')
for i in range(1, 11):
    data = "%d번째 줄입니다.\n" % i
    f.write(data)
f.close()


# 첫 번째 줄을 읽오는 법 : readline

f = open("C:/doti/새파일.txt", 'w')
line = f.readline()
print(line)
f.close()

# 1 번째 줄입니다.


# readline_all.py
f = open("C:/doti/새파일.txt", 'w')
while True:
    line = f.readline()
    if not line: break
    print(line)
f.close()


while 1:
    data = input()
    if not data: break
    print(data)


# readlines : 파일의 모든 줄을 읽어서 각 줄을 list형태로 반환해준다.
f = open("C:/doti/새파일.txt", 'r')
lines = f.readlines()
for line in lines:
    print(line)
f.close()


# read : 문장 전체를 문자열로 반환해준다.
f = open("C:/doti/새파일.txt", 'r')
data = f.read()
print(data)
f.close()


# 'w' mode로 file을 열게 되면 기존 내용이 모두 사라진다. 
# 'a' (추가 모드)를 사용하여 열고 수정 작업을 해야한다.

# adddata.py
f = open("C:/doti/새파일.txt", 'a')
for i in range(11, 20):
    data = '%d 번째 줄입니다.\n' % i
    f.write(data)
f.close()


f = open('foo.txt', 'w')
f.write('Life is too short, you need python')
f.close()

# with를 사용하면 객체를 벗어나는 순간 close를 해주어서 편하다.
with open('foo.txt', 'w') as f:
    f.write("Life is too short, you need python")



import sys

args = sys.argv[1:]
for i in args:
    print(i)

args