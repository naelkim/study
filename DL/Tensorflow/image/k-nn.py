import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn import datasets, metrics
from sklearn.model_selection import train_test_split
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
                    distance[j] = np.sum(np.abs(self.x_train[j] - x[j]))
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



# image data

digits = datasets.load_digits()
images, labels = digits.images, digits.target

train_images, test_images, train_labels, test_labels = train_test_split(images, labels, test_size = 0.3, random_state = 42)

print(train_images.shape, test_images.shape, train_labels.shape, test_labels.shape)

nn = Nearest_Neighbor()
nn.fit(train_images, train_labels)

y_pred = np.zeros(len(test_labels))

