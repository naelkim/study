from numpy import gradient
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.model_selection import GridSearchCV
from sklearn.datasets import load_breast_cancer
iris = load_breast_cancer()

x_train, x_test, y_train, y_test = train_test_split(iris.data, iris.target, test_size = 0.2, random_state = 42)

print(x_train.shape, x_test.shape, y_train.shape, y_test.shape)

rf = RandomForestClassifier(random_state = 2)
rf.fit(x_train, y_train)
y_pred = rf.predict(x_test)
accuracy_score(y_test, y_pred)

params = {
    'n_estimators' : [100],
    'max_depth' : [6, 8, 10, 12],
    'min_samples_leaf' : [8, 12, 18],
    'min_samples_split' : [8, 16, 20]
}

rf = RandomForestClassifier(random_state = 2, n_jobs= -1)
grid_rf = GridSearchCV(rf, param_grid = params, cv = 2, n_jobs = -1)
grid_rf.fit(x_train, y_train)

print( grid_rf.best_params_)
print( grid_rf.best_score_)

x_train = pd.DataFrame(x_train, columns = iris.feature_names)
x_train
import matplotlib.pyplot as plt
import seaborn as sns

rf_clf = RandomForestClassifier(max_depth = 6, min_samples_leaf = 8, min_samples_split = 20, n_estimators = 100)
rf_clf.fit(x_train,y_train)
y_pred = rf_clf.predict(x_test)

feature_im = rf_clf.feature_importances_
feature_im = pd.Series(feature_im, index = iris.feature_names )

feature_top10 = feature_im.sort_values(ascending= False)[:10]

plt.figure(figsize = (8,6))
sns.barplot(x = feature_top10, y = feature_top10.index)
plt.show()
