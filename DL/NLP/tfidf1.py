corpus = [
    'jazz music has a swing rhythm',
    'swing is hard to explain',
    'swing rhythm is a natural rhythm'
]


from sklearn.feature_extraction.text import CountVectorizer
cv = CountVectorizer(stop_words=['is','to'])

vector = cv.fit_transform(corpus)
import pandas as pd
vector # vector has 3x11 sparse matrix 

df = pd.DataFrame(vector.toarray(), columns = cv.get_feature_names())

df
#    explain  hard  has  jazz  music  natural  rhythm  swing
# 0        0     0    1     1      1        0       1      1
# 1        1     1    0     0      0        0       0      1
# 2        0     0    0     0      0        1       2      1


from sklearn.metrics.pairwise import cosine_similarity

print(cosine_similarity(df, df))
# [[1.         0.25819889 0.54772256]
#  [0.25819889 1.         0.23570226]
#  [0.54772256 0.23570226 1.        ]]


from sklearn.feature_extraction.text import TfidfVectorizer

vector = TfidfVectorizer()
tfidf = vector.fit_transform(corpus)

tfidf # 3x10 saprse matrix 

df1 = pd.DataFrame(tfidf.toarray(), columns = vector.get_feature_names())
df1

print(cosine_similarity(df1, df1))

# [[1.         0.08882283 0.36893431]
#  [0.08882283 1.         0.22720498]
#  [0.36893431 0.22720498 1.        ]]