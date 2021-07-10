import pandas as pd
from sklearn.ensemble import VotingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
from sklearn.tree import DecisionTreeClassifier
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
import warnings 
warnings.filterwarnings('ignore')

cancer = load_breast_cancer()
data = pd.DataFrame(cancer.data, columns = cancer.feature_names)
logit = LogisticRegression()
KNN = KNeighborsClassifier(n_neighbors= 8)
voting = VotingClassifier( estimators= [ ('LR', logit), ('KNN', KNN)], voting = 'soft')
x_train, x_test, y_train, y_test = train_test_split(cancer.data, cancer.target, test_size = 0.2, random_state = 42)

voting.fit(x_train, y_train)
y_pred = voting.predict(x_test)
voting_acc = accuracy_score(y_test, y_pred)
clf = [logit, KNN]
for c in clf :
    c.fit(x_train, y_train)
    pred = c.predict(x_test)
    class_name = c.__class__.__name__
    print(class_name, accuracy_score(y_test, pred))