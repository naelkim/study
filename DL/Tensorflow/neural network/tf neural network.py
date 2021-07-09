import tensorflow as tf

# sotfmax function
import math

def sigmoid(x):
    return 1 / ( 1 + math.exp(-x))

x = 1
y = 0
w = tf.random.normal([1], 0, 1)

output = sigmoid(x * w)
print(output)
# 0.641031440898322



# gradient descent 
for i in range(1000):
    output = sigmoid(w * x)
    error = y - output
    w = w + x * 0.1 * error 

    if i % 100 == 99:
        print(i, error, output)


# x = 0 일 때 y = 1 을 얻는 뉴런의 학습
x = 0
y = 1
w = tf.random.normal([1], 0, 1)

for i in range(1000):
    output = sigmoid(w * x)
    error = y - output 
    w = w + x * 0.1 * error 

    if i % 100 == 99 :
        print(i, error, output)


# x = 0 일 때 y = 1 을 얻는 학습에 편향을 더함.
x = 0 
y = 1 
w = tf.random.normal([1], 0, 1)
b = tf.random.normal([1], 0, 1)

for i in range(1000):
    output = sigmoid(w * x + b)
    error = y - output 
    w = w + x * 0.1 * error 
    b = w + 1 * 0.1 * error


