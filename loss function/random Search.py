import numpy as np

bestloss = float('inf')

for num in xrange(1000):
    W = np.random.randn(10, 3073) * 0.0001
    loss = L(x_train, y_train, W)
    if loss < bestloss:
        bestloss = loss
        bestW = W
    print('in attempt %d the loss was %f, best %f' %(num, loss, bestloss))

score = Wbest.dot(x_test)

y_pred = np.argmax(score, axis = 0)
np.mean(y_pred == y_test)
