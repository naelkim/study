import numpy as np

# 1
x = []
for i in range(11, 111, 10):
    x.append(list(range(i-10, i)))  
x = np.array(x)
x

# 2
np.arange(1, 101).reshape(-1,10)


# 3
y = np.array(range(11))
y.reshape(-1,1)



arr = np.arange(10)
arr

np.sqrt(arr)

np.exp(arr)

x = np.random.randn(8)
y = np.random.randn(8)

x

y

np.add(x, y)

np.maximum(x, y)

# out인자를 통해 y에 저장할 수 있다. 
np.add(x, y, out = y)



# 브로드 캐스팅
a = np.array([0, 1, 2])
b = np.array([5, 5, 5])
a + b


a + 5


arr1 = np.ones((2, 3))
arr2 = np.arange(3)

arr1 + arr2 


arr1 = np.arange(3).reshape((3, 1))
arr2 = np.arange(3)

arr1 

arr2 


arr1 + arr2 

# 계산이 안되는 경우 
arr1 = np.ones((3, 2))
arr2 = np.arange(3)

arr1 

arr2 

arr1 + arr2 


arr = np.random.randn(4, 4)
arr 

arr > 0 

np.where( arr > 0, 2, -2)


np.where( arr > 0, 2, arr )


arr = np.random.randn(5, 4)
arr 

arr.mean()

np.mean(arr)

np.sum(arr)



arr

np.mean(arr, axis = 1)

np.sum(arr, axis = 0 )



arr = np.array([0, 1, 2, 3, 4, 5, 6, 7])
arr.cumsum()

arr = np.array([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
arr 

arr.cumsum(axis = 0 )


arr.cumprod(axis = 1)


arr = np.ramdom.randn(20)

arr > 0 

# count
(arr > 0 ).sum()

bools = np.array([False, False, True, False])

bools.any()

bools.all()


value1 = np.array([6, 0, 0, 3, 2, 5, 6])
value2 = np.array([2, 3,6])
np.in1d(value1, value2)


arr = np.arange(10)
np.save("some_array", arr)

np.load("some_array.npy")


