import matplotlib.pyplot as plt
from sklearn import datasets, metrics
from sklearn.model_selection import train_test_split
digits = datasets.load_digits()

images, labels = digits.images, digits.target

image_and_label = list(zip(images, labels))

for i in range(len(labels)):
    plt.subplot(2, 4, i + 1)
    plt.axis('off')
    plt.imshow(images[i], cmap = 'gray' )
plt.show()



for index, (image, label) in enumerate(image_and_label):
    plt.subplot(2, 4, index + 1)
    plt.axis('off')
    plt.imshow(image, cmap = plt.cm.gray_r, interpolation  = 'nearest')
    plt.title( ' Traning : %i' % label)
plt.show()


for i in range(len(labels)):
    plt.subplot(2, 4, i + 1)
    plt.axis('off')
    plt.imshow(images[i], cmap = 'gray' )
plt.show()





train_images, test_images, train_labels, test_labels = train_test_split(images, labels, test_size = 0.3,random_state = 42)

print(train_images.shape, test_images.shape, train_labels.shape, test_labels.shape)