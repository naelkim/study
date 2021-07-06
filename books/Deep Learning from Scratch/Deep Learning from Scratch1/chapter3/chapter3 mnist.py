import tensorflow as tf
import numpy as np
mnist = tf.keras.datasets.mnist

def init_network():
    network = {}
    network['w1'] = np.array([[0.1, 0.3, 0.5], [0.2, 0.4, 0.6]])
    network['b1'] = np.array([0.1, 0.2, 0.3])
    network['w2'] = np.array([[0.1, 0.4], [0.2, 0.5], [0.3, 0.6]])
    network['b2'] = np.array([0.1, 0.2])
    network['w3'] = np.array([[0.1, 0.3], [0.2, 0.4]])
    network['b3'] = np.array([0.1, 0.2])

    return network


def sigmoid_function(x):
    return 1 / ( 1 + np.exp(-x))

def softmax(a):
    exp_a = np.exp(a)
    sum_exp_a = np.sum(exp_a)
    y = exp_a / sum_exp_a

    return y 

def get_data():
    (x_train, t_train), (x_test, t_test) = mnist.load_data()
    return x_test, t_test

def predict(network, x):
    w1, w2, w3 = network['w1'], network['w2'], network['w3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, w1) + b1
    z1 = sigmoid_function(a1)

    a2 = np.dot(z1, w1) + b2
    z2 = sigmoid_function(a2)

    a3 = np.dot(z2, w3) + b3
    y = softmax(a3)

    return y

x, t = get_data()

network = init_network()


accuracy_cnt = 0 
for i in range(len(x)):
    y = predict(network, x[i])
    p = np.argmax(y)
    if p == t[i]:
        accuracy_cnt += 1

print("Accuracy:" + str(float(accuracy_cnt) / len(x)))