
# dictionary
dic = {
    'name' : 'pey',
    'phone' : '0119993323',
    'birth' : '1118'
    }
dic # {'name': 'pey', 'phone': '0119993323', 'birth': '1118'}

# key 값은 정수, Value 값은 문자열
a = {1 : 'hi'} # {1: 'hi'}

# list 형태도 가능 
a = { 'a' : [1, 2, 3]} # {'a': [1, 2, 3]}

# dict pair add
a = {1 : 'a'}
a[2] = 'b'
a  # {1: 'a', 2: 'b'}

a['name'] = 'pey'
a # {1: 'a', 2: 'b', 'name': 'pey'}

a[3] = [1, 2, 3]
a # {1: 'a', 2: 'b', 'name': 'pey', 3: [1, 2, 3]}


# drop key
del a[1]
a # {2: 'b', 'name': 'pey', 3: [1, 2, 3]}

# key, value
grade = {'pey' : 10, 'julliet' : 99}

grade['pey'] # 10

grade['julliet'] # 99

a = {'a' : 1, 'b' : 2}

a['a'] # 1

dic = {
    'name' : 'pey',
    'phone' : '0119993323',
    'birth' : '1118'
    }

dic['name'] # pey

dic['phone'] # 0119993323

dic['birth'] # 1118

# dict의 key값이 중복이 되면 먼저 입력된 변수가 제거 된다.
a = {1 : 'a', 1: 'b'}
a # {1: 'b'}

# key 값은 list 사용 불가
a = {[1, 2] : 'hi'}  # error


# dic 관련 func.
dic.keys() # dict_keys(['name', 'phone', 'birth'])


for k in dic.keys():
    print(k)

# name
# phone
# birth

list(dic.keys()) # ['name', 'phone', 'birth']


dic.values() # dict_values(['pey', '0119993323', '1118'])


# tuple 값으로 되돌려준다.
dic.items() # dict_items([('name', 'pey'), ('phone', '0119993323'), ('birth', '1118')])

# clear
dic.clear()
dic # {}

# get

dic = {
    'name' : 'pey',
    'phone' : '0119993323',
    'birth' : '1118'
    }

dic.get('name') # 'pey'

dic.get('name') == dic['name'] # True

dic.get('fd') # None 반환

dic['fd'] # error

'name' in dic # True

'email' in dic # False


#######

