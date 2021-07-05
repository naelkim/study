import numpy as np
import matplotlib.pyplot as plt
import math

class Nearest_Neighbor:
    def __init__(self):
        pass

    def fit(self, x, y):
        self.x_train = x
        self.y_train = y

    def predict(self, x, L):
        num_test = x.shape[0]
        y_pred = np.zeros(num_test, dtype = self.y_train.dtype ) 

        if L == 'M' :
            for i in np.arange(len(x)):
                print(i, '\n')

                distance = np.zeros(len(self.x_train))
                for j in np.arange(len(self.x_train)):
                    distance[j] = np.sum(np.abs(self.x_train.iloc[j] - x.iloc[j]), axis = 0)
                min_index = np.argmin(distance)
                y_pred[i] = self.y_train.iloc[min_index]

        if L == 'U' :
            for i in np.arange(len(x)):
                print(i, '\n')

                distance = np.zeros(len(self.x_train))
                for j in np.arange(len(self.x_train)):
                    distance[j] = math.sqrt( np.sum( (self.x_train.iloc[j] - x.iloc[j])**2, axis = 0 ) )
                min_index = np.argmin(distance)
                y_pred[i] = self.y_train.iloc[min_index]
        
        return y_pred 



# structure data
from sklearn.datasets import load_boston
from sklearn.model_selection import train_test_split
import pandas as pd
boston = load_boston()

x = pd.DataFrame(boston.data, columns = boston.feature_names)
y = pd.DataFrame(boston.target, columns = ['price'])

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 42)
print(x_train.shape, x_test.shape, y_train.shape, y_test.shape)

nn = Nearest_Neighbor()
nn.fit(x_train, y_train)


nn.predict(x_test, 'M')



# image data

from sklearn import datasets, metrics
digits = datasets.load_digits()
images, labels = digits.images, digits.target
test_size = math.floor(len(labels)/ 3)

test_labels = pd.DataFrame(labels[1:test_size])
train_labels = pd.DataFrame(labels[test_size:])

print(train_labels.shape, test_labels.shape)




nn = Nearest_Neighbor()
nn.fit(x = train_labels.iloc[:,0], y = train_labels.iloc[:,1])

nn.predict(x = test_labels, L = 'M')