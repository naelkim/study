import torch 
import torch.nn as nn
import torch.nn.functional as F 
import torch.optim as optim
import numpy as np
import pandas as pd






corpus = [
    'he is a king',
    'she is a queen',
    'he is a man',
    'she is a woman',
    'warsaw is poland capital',
    'berlin is germany capital',
    'paris is france capital',
    'seoul is korea capital', 
    'bejing is china capital',
    'tokyo is japan capital',
]

def tokenize_corpus(corpus):
    tokens = [i.split() for i in corpus]
    return tokens

tokenized_corpus = tokenize_corpus(corpus)


tokenized_corpus

# 단어들의 중복을 제거하여 vocabulary 리스트를 만들고 word2idx, idx2word dict를 만든다.

vocabulary = []
for sentence in tokenized_corpus:
    for token in sentence:
        if token not in vocabulary:
            vocabulary.append(token)

vocabulary

word2idx = {w : idx for (idx, w) in enumerate(vocabulary)}
idx2word = {idx : w for (idx, w) in enumerate(vocabulary)}

vocab_size = len(vocabulary)

# setting window_size 
window_size = 2
idx_pairs = []

for sentence in tokenized_corpus:
    indices = [word2idx[word] for word in sentence]
    for center_word_pos in range(len(indices)): # 해당 단어의 index 
        for w in range(-window_size, window_size + 1): # window_size 가 2이기 때문에 양쪽 두개씩 총 4개의 window_size
            context_word_pos = center_word_pos + w
            if context_word_pos < 0 or context_word_pos >= len(indices) or center_word_pos == context_word_pos :
                continue # index가 0보다 작을때, 총 길이보다 길 때, center_word_pos와 같은 index를 가리킬 때 continue
            context_word_idx = indices[context_word_pos]
            idx_pairs.append([indices[center_word_pos], context_word_idx])
            print(idx_pairs)

idx_pairs = np.array(idx_pairs)


idx_pairs[0:10]


def get_input_layer(word_idx):
    return np.eye(vocab_size)[word_idx]


x, y, = [], []

for data, target in idx_pairs:
    x.append(get_input_layer(data))
    y.append(target)

x = torch.FloatTensor(np.array(x))
y = torch.Tensor(np.array(y)).long()


class Word2VecModel(nn.Module):
    def __init__(self, input_dim):
        super().__init__()
        self.linear1 = nn.Linear(input_dim, 2)
        self.linear2 = nn.Linear(2, input_dim)

    def forward(self, x):
        return self.linear2(self.linear1(x))


model = Word2VecModel(x.size(dim = -1))


# optimizer
optimizer = optim.Adam(model.parameters())


nb_epoch = 100
for epoch in range(nb_epoch + 1):
    # H(x)
    prediction = model(x)

    # cost
    cost = F.cross_entropy(prediction, y)

    # cost로 H(x) 개선
    optimizer.zero_grad()
    cost.backward()
    optimizer.step()

    # 20번 마다 로그 출력
    if epoch % 20 == 0 :
        print( 'Epoch {:4d}/{} Cost : {:.6f}'.format( epoch, nb_epoch, cost.item()))



vector = model.state_dict()['linear2.weight'] + model.state_dict()['linear2.bias'].view(-1, 1)
w2v_df = pd.DataFrame(vector.numpy(), columns = ['x1', 'x2'])
w2v_df['word'] = vocabulary 
w2v_df = w2v_df[['word','x1','x2']]

w2v_df



ano = w2v_df['word'].values 
x1 = w2v_df['x1'].values 
x2 = w2v_df['x2'].values


import matplotlib.pyplot as plt 

fig, ax = plt.subplots(figsize = (5, 5))
ax.scatter(x1, x2)

for i, txt in enumerate(ano):
    ax.annotate(txt, [x1[i], x2[i]])

plt.show()