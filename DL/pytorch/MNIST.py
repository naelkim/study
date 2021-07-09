import torch
import torchvision.datasets as dsets
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
import torch.nn as nn
import matplotlib.pyplot as plt
import random

# use_cuda = torch.cuda.is_available()
# device = torch.device('cuda' if use_cuda else 'cpu')

device = torch.device('cpu')
print(device)

random.seed(42)
torch.manual_seed(42)

epochs = 15
batch_size = 100

# download
mnist_train = dsets.MNIST(root = 'MNIST_data/', train  = True, transform = transforms.ToTensor(), download = True)

mnist_test = dsets.MNIST(root = 'MNIST_data/', train  = False, transform = transforms.ToTensor(), download = True)


data_loader = DataLoader(
    dataset = mnist_train,
    batch_size = batch_size,
    shuffle = True,
    drop_last = True
)

linear = nn.Linear(784, 10, bias = True)

criterion = nn.CrossEntropyLoss() # 내부적으로 softmax func.를 사용하고 있다.
optim = torch.optim.SGD(linear.parameters(), lr = 1e-04, momentum = 0.01)

for epoch in range(epochs):
    avg_loss = 0
    total_batch = len(data_loader)

    for x, y in data_loader:
        x = x.view(-1, 28*28)

        optim.zero_grad()
        hypothsis = linear(x)
        loss = criterion(hypothsis, y)
        loss.backward()

        optim.step()

        avg_loss += loss / total_batch

        if avg_loss < 0.001:
            break

    print('Epoch:', '%04d' % (epoch + 1), 'cost =', '{:.9f}'.format(avg_loss))



X_test = mnist_test.test_data.view(-1, 28 * 28).float()
Y_test = mnist_test.test_labels

predict = linear(X_test)
correct_prediction = torch.argmax(predict, 1) == Y_test
accuracy = correct_prediction.float().mean()
print('Accuracy:', accuracy.item())

# MNIST 테스트 데이터에서 무작위로 하나를 뽑아서 예측을 해본다
r = random.randint(0, len(mnist_test) - 1)
X_single_data = mnist_test.test_data[r:r + 1].view(-1, 28 * 28).float().to(device)
Y_single_data = mnist_test.test_labels[r:r + 1].to(device)

print('Label: ', Y_single_data.item())
single_prediction = linear(X_single_data)
print('Prediction: ', torch.argmax(single_prediction, 1).item())

plt.imshow(mnist_test.test_data[r:r + 1].view(28, 28), cmap='Greys', interpolation='nearest')
plt.show()