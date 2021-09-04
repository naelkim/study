# 529p ----
11 + 12 + 13 # 36


# 533p ----
fah <- readline('Fahrenheit? ') # input
fah <- as.numeric(fah)
cel <- (fah-32) /1.8
print(paste('Celsius = ', cel))



# config ----
getwd()


path = "C:/Users/EonKim/Desktop"
setwd(dir = path)

# 작업 공간 저장 
save.image()


x <- 100
y <- c(2, 3, 5, 7)
z <- 3.14
hero <- c('Superman', 'Batman', 'Spiderman')
f <- function(y) (y-32) / 1.8
ls() # 변수 이름을 string으로 이루어진 하나의 vector로 반환한다.

ls(pattern = 'e') # hero

history()

# 어떤 library가 잇는지 찾아낸다.
library()


# library를 사용하기 위해서는 컴퓨터의 메모리에 적재를 시켜야하는데 
# 어떤 library들이 적재되어있는지 확인하는 함수.
if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)
search()

# 적재된 패키지를 없애기 위해서는 detach()를 사용
library(lattice)
search()

detach(package:lattice)
search()



# library의 path를 보여준다. 
.libPaths()


# check dataset ----
data(package = 'ggplot2')


head(cars) # default 6

tail(cars)

head(cars, 3)



# help ----

help.start()

help("median")
help(median)
?median

example(median)


help.search(median)
??median

help(xyplot, package = 'lattice')

example(xyplot, package = 'lattice')


# RSiteSearch() r환경을 벗어나지 않고 검색해준다.
# RSiteSearch() == sos.findFn()

RSiteSearch('topicmodels')

if (!require(sos)) install.packages('sos')
library(sos)

findFn('social network analysis')
# 548p ----
# data structure ----
# vector, factor, matrix, array, dataframe, list, etc..

# vector ----
vec1 <- c(2, 3, 5, 7, 11)
vec2 <- c('cat', 'dog', 'fox', 'horse', 'pig', 'rabbit')
vec3 <- c(TRUE, FALSE, TRUE)
vec4 <- c(4:-2)

vec2

vec2[3]

vec2[c(1, 3, 5)]

vec2[3:5]


# vector operation broadcasting

c(1:3) + c(4:9)
# 1, 2, 3, 1, 2, 3
# 4, 5, 6, 7, 8, 9

10 + c(1, 3, 5)

# concat string
fruit <- c('Apple', 'Banana', 'Strawberry')
food <- c('Pie', 'Juice', 'Cake')

# paste operation is broadcasting
paste(fruit, food)

# absolute
abs(-3:3)

# sqrt
sqrt(1:5)
sqrt(c(1:5))



# factor ----
review <- c('Good', 'Good', 'Indifferent', 'Bad', 'Good', 'Bad')
review.factor <- factor(review)

class(review.factor)
class(review) # type

str(review.factor) # info

summary(review.factor) # value_counts, describe


as.numeric(review.factor) # astype('int64')

levels(review.factor) # find label

levels(review.factor) <- c('B', 'G', 'I')

# 레벨을 변경하면 자동으로 바뀐다. 
review.factor


eval <- c('Medum', 'Low', 'High', 'Medium', 'High')
eval.ordered <- factor(eval, levels = c('Low', 'Medium', 'High'), ordered = TRUE)

# ordered = TRUE 를 안해주면 부등호가 생기지 않는다. 
# default : ordered = FALSE
eval.ordered

eval.factor <- factor(eval)

table(eval.factor) # summary(eval.factor)


# levels에 없는 값은 <NA>로 변경된다.
sex <- c(1, 2, 2, 1, 0, 1, 2)
sex.factor <- factor(sex, levels = c(1, 2), labels = c('Male', 'Female'))

sex.factor



# matrix ----
# default : byrow = F
matrix(data = 1:12, nrow = 3, ncol = 4, byrow = F) 

rnames <- c('R1', 'R2', 'R3')
cnames <- c('C1', 'C2', 'C3', 'C4')


matrix(data = 1:12, nrow = 3, ncol = 4, dimnames = list(rnames, cnames), byrow = T)

mat <- matrix(1:12, 3)
# 행또는 열만 추출하면 1-dim vector로 반환한다.
mat[2,]
mat[,3]


# same
mat[1:2, 3:4]
mat[c(1,2), c(3, 4)]

mat[2,, drop = F]



# array ----
ary <- array(data = 1:12, dim = c(2, 3, 2))
ary

ary[1, 3, 2]

ary[, 1, 2]


ary[1, 3, 2, drop=F]

ary[, 1, 2, drop=F]


# reduce dimention 
ary[2,,]



# dataframe ----
# 구조상 matrix와 동일한 구조를 가지지만 matrix와는 달리 각 열마다 다른 성분을
# 가질 수 있다는 것이 가장 큰 차이점이다. 
ID <- c(1:5)
name <- c('Mouse', 'Keyboard', 'USB', 'CPU', 'Monitor')
price <- c(30000, 90000, 45000, 550000, 250000)
madeby <- c('Logitech', 'Logitech', 'Samsung', 'Intel', 'Samsung')
country <- c('USA', 'China', 'Korea', 'USA', 'Korea')
product <- data.frame(ID, name, price, madeby, madein = country)

product


names(product) # columns


product[1:2]

product[, c('name', 'madeby')]


product$ID

# 교차표를 만들 수 있다. user-item table
table(product$madeby, product$madein)



# list ----
a <- 'List Example'
b <- 1:3
c <- c('one', 'two', 'three')
d <- matrix(1:12, nrow=3)
e <- data.frame(num=b, word=c)
f <- list(num=b, word=c)
g <- mean
h <- lm(mpg~wt, data=mtcars)
lst <- list(title = a, number = b, c, d, e, f, g, h)
lst



lst[[2]]

lst[['number']]

lst$number

lst <- list(one = 1, two = 2, three = list(alpha = 3, beta = 2))
lst

lst[['three']]

lst$three

lst[['three']][['beta']]

lst$three$beta


rainfall <- list(21.6, 23.6, 45.8, 77.0, 102.2, 133.3, 327.9, 348.0, 137.6, 49.3, 53.0, 24.9)
mean(rainfall) # error

mean(unlist(rainfall))

# 565p ----
# trans type ----

# 롱 포맷과 와이드 포맷
# 와이드 포맷은 우리가 일반적으로 보는 dataframe
# 롱 포맷은 groupby를 취해준 dataframe 과 유사하다.


# gether ----

head(airquality)

if (!require(tidyr)) install.packages(tidyr)

library(tidyr)

# data : 사용할 데이터 
# key : 변수명이 들어갈 column의 이름
# value : 변수 값들이 들어갈 column의 이름
# 타겟 변수 Ozone:Temp
# 타겟에 들어가지 않은 변수는 구분 변수(식별변수) 로 들어간다. 

aq.long <- gather(data=airquality, key = Factor, value = measurement, Ozone:Temp)

head(aq.long)


# same
head(gather( data=airquality, Factor, measurement, -Month, -Day))
head(gather( data=airquality, Factor, measurement, -c(Month, Day)))


# spread ----
# tidyr 의 spread는 long format을 다시 wide format으로 바꾸어준다. 
aq.wide <- spread(data=aq.long, key = Factor, value = measurement)
head(aq.wide)


# separate ----
head(iris)

iris.long <- gather(data=iris, key=Element, value=Measurement, -Species)
head(iris.long)

# data : dataset
# col : 분할할 현재 열 이름
# into : 새롭게 분할 후 생성될 열의 이름
# sep : 분할에 사용할 문자나 정규표현식 등등 split or re.sub

iris.sep <- separate(data=iris.long, col=Element, into=c('Part', 'Measures'))
head(iris.sep)



# unite ----
# data : dataset
# col : 새로운 열의 이름
# 그다음 인자는 결합할 열 이름
iris.unite <- unite(data=iris.sep, col = Factor, Part, Measures, sep='_')

head(iris.unite)

# 571p ----

# missing value ----

# is.na ----
# NA 값을 TRUE로 반환한다.
x <- c(1, 2, 3, NA)
is.na(x)

x[!is.na(x)]

# complete.cases ----
# na.omit()
# 행렬이나 데이터프레임에서 결측값이 포함되지 않은 행을 식별한다.
# 누락된 관측값이 없는 행에 대해서는 TRUE를 반환하고, 하나라도 결측치가 있으면 FALSE를 반환한다.


str(airquality)

# complete.cases == na.omit
head(airquality[complete.cases(airquality),])

na.omit(airquality)


# reverse
airquality[!complete.cases(airquality),]

# sum, mean

# 왜 다르게 나올까?
# is.na는 NA값인 모든 값을 가져오는 함수이고, complete.cases는 하나라도 NA면 열을 가져오는거라
# 2개이상 NA값을 가진 경우가 있을 수 있기 때문이다. 
sum(is.na(airquality)) # 44

# 4.7%에 해당한다. 44 / (153*6) = 0.047
sum(!complete.cases(airquality)) 

# question1 ----
# 하나라도가 아니라 columns별로 결측치가 일정 개수 이상 있는 값을 제거하고 싶을땐 어떻게 해주어야할까?
dt = data.frame(x = c(1, 2, 3, NA, 4), y = c(NA, 1, 2, 3, 4))
dt[complete.cases(dt),]

# 하나라도 결측치인 row의 개수를 출력
sum(!complete.cases(airquality)) # 42

# 27% 에 해당한다. 42/153 = 0.27
mean(!complete.cases(airquality))



# visualization ----
if (!require(mice)) install.packages('mice')

library(mice)


# md.pattern ----
# 출력되는 0과 1은 결측값과 비결측값을 보여준다.
# 1인 경우 결측값이 전혀 없는 패턴
# 왼쪽의 숫자는 패턴의 개수
# 오른쪽의 숫자는 결측값이 발생한 변수의 개수 
# 아래의 값은 해당 열의 결측치 수

md.pattern(airquality)

# VIM package ----

if (!require(VIM)) install.packages('VIM')
library(VIM)

# aggr ----
# prop : default = TRUE, 확률값이 나오고, FALSE는 결측치의 개수.
# number : default = FALSE,오른쪽의 각 대응되는 패턴의 개수를 의미한다.
# sortVar : sort_values
miss <- aggr(airquality, prop=FALSE ,numbers=TRUE, sortVar=TRUE)

summary(miss)$combinations

# matrixplot ----
# sortby : 해당 열을 가지고 정렬을 해준다.
# 내림차순으로 정령해준다. 
matrixplot(airquality, sortby= 'Month') # Month 대신에 5 숫자로 넣어도 가능.

# marginplot ----
# scatterplot은 Solar.R과 Ozone의 관계를 보여주며, 누락된 값은 제외한다.
# Y축 margin region의 boxplot은 Solar.R 변수값이 존재하는 경우와 누락된 경우의 Ozone 변수의 분포.
# X축 margin region의 boxplot은 Ozone 변수값이 존재하는 경우와 누락된 경우의 Solar.R 변수의 분포.

# 결측값은 빨간색으로 표시되어 있다. (orangered)
# Y축 barplot 아래의 숫자는 Ozone 변수에 결측치가 발생한 케이스의 수
# X축 barplot 아래의 숫자는 Solar.R 변수에 결측치가 발생한 케이스의 수
# 구석의 교차지점은 두 변수 모두 결측치가 발생한 케이스의 수 

marginplot(airquality[c('Solar.R', 'Ozone')],
           pch=20, col=c('cornflowerblue', 'orangered', 'purple'))


# correlation ----

# boolean 값에 abs를 해주면 0, 1 로 변환된다. 
x <- data.frame(abs(is.na(airquality)))
head(airquality)
head(x)

# 결측치가 있는 columns을 가져온다.
# 결측치가 있는 변수 간 상관계수를 check할 때 그닥 유의미하다고는 볼 수 없다.
y <- x[colSums(x) > 0]
cor(y)

with(y, cor.test(Ozone, Solar.R))

if (!require(dplyr)) install.packages('dplyr')
library(dplyr)

head(y)


y %>% 
  cor.test(Ozone, Solar.R)

with(y, cor.test(Ozone, Solar.R))



# 581p ----
# preprocessing ----
# preprocessing with missing values
# listwise deletion ----
# listwise deletion은 하나라도 결측치가 있으면 제거하는 방식이다. 
# 이 경우 앞단에서 사용한 complete.cases나 na.omit을 사용한다. 

cor(airquality[complete.cases(airquality),])

cor(na.omit(airquality))

anova(lm(Ozone~Temp, data = na.omit(airquality)))

# 동일한 결과
# method : perason, kendall, spearman 
# use : everthing, all.obs, complete.obs, na.or.complete, pairwise.complete.obs
cor(airquality, use='complete.obs') 

if (!require(corrplot)) install.packages('corrplot')
library(corrplot)

# pairwise deletion ----
cor(airquality, use='pairwise.complete.obs')

# corrplot ----
# method : circle, square, ellipse, number, shade, color, pie
corrplot(cor(airquality, use='pairwise.complete.obs'), method = 'circle')
plot(airquality)

# 37개의 결측치가 제거된 것을 볼 수 있다. 
# lm 에서는 pairwise deletion을 하는데, 이 경우 변수간 NA값을 제거하기 때문에 
# 다른 변수가 들어갈 경우 결측치의 개수가 달라져 분석에 문제가 생길 수도 있다. 
air.lm <- lm(Ozone ~Temp, data=airquality)
summary(air.lm)


# simple imputation ----
# 평균값이나 중위수 등 하나의 값으로 채워넣는 것을 말한다. 
airquality.new <- airquality
for ( i in 1:ncol(airquality.new)){
  if(sum(is.na(airquality.new[,i])) > 0){ # 결측치가 하나라도 있는 것을 찾는다.
    na.idx <- which(is.na(airquality.new[,i])) # 해당 위치의 idx를 저장한다.
    airquality.new[na.idx, i] <- mean(airquality.new[,i], na.rm=TRUE) # 저장한 idx에 mean값을 대체한다.
  }
}

mean(airquality$Ozone, na.rm=TRUE)
mean(airquality$Solar.R, na.rm=TRUE)

# multi imputation ----
# mice ----
# 결측치 제거하는 pack.에는 Aemlia, mi 등이 있다. 
if (!require(mice)) iinstall.packages('mice')

library(mice)

# method : norm.predict, mean, pmm(predictive mean matching)
# 데이터가 연속형일 경우 pmm을 쓴다. 
# m : 생성할 대체값의 개수 default = 5 
# maxit : 알고리즘 반복 횟수 default = 5
imp <- mice(airquality, method='mean', m=1, maxit=1)
imp

head(complete(imp))

# nhanes dataset
# columns : age, bmi, hyp(고혈압 여부), chl(혈청콜레스테롤)

str(nhanes)

head(nhanes)

imp <- mice(nhanes, seed = 123)
imp

# attributes : mice() 함수로부터 반환된 객체에 저장된 정보 목록을 추출하는 함수 
attributes(imp)

imp$data

imp$imp
# 3번째 대체 데이터셋을 추출.
c3 <- complete(imp, action=3)
md.pattern(c3)

# 5개의 대체 데이터셋을 long format으로 출력한다. 
c.long <- complete(imp, action = 'long')
c.long

c.median <- aggregate(c.long[3:6], by=list(id=c.long$.id), median)
head(c.median[-1])


ini <- mice(nhanes, maxit = 0 )
pred <- ini$predictorMatrix
pred
pred[,'hyp'] <- 0
pred

imp <- mice(nhanes, predictorMatrix = pred)
imp


# quickpred ----
# 일정 기준에 따라 자동으로 예측변수를 선택할 수 있다.
# 상관계수가 0.3이상인 변수만을 선택.

imp <- mice(nhanes, predictorMatrix = quickpred(nhanes,mincor=0.3))
imp


# nhanes2 : nhanes 데이터와 동일하지만, age와 hyp변수가 factor로 되어있다.
str(nhanes2)

# data가 범주형인 경우 logistic reg. 를 사용한다.
imp <- mice(nhanes2)
imp


# 사용가능한 결측치 추정 방법을 확인할 때 출력해보자.
methods(mice)


ini <- mice(nhanes2, maxit=0)
meth <- ini$method
meth['bmi'] <- 'norm.predict'

imp <- mice(nhanes2, method=meth)
imp

# 두 값이 동일하다.
summary(aov(lm(age~ bmi+hyp+chl, data = nhanes)))
anova(lm(age~ bmi+hyp+chl, data = nhanes))


# stripplot ----
# 빨간색은 대체값, 파란색은 관측값
imp <- mice(nhanes2, seed=123)
stripplot(imp, bmi~.imp, pch=21, cex=1.5)
stripplot(imp, pch=21, cex=1.2)

nhanes
head(nhanes)
# imp <- mice(nhanes2, m=1, seed=123)
fit <- with(imp, lm(chl~bmi+hyp))
fit

with(nhanes, lm(chl~bmi+hyp))


summary(fit$analyses[[3]])


# pool ----
# mice에서 m=5로 설정했기 때문에 5개의 예측값을 평균내어 lm을 해주는 함수
pooled <- pool(fit)
pooled

summary(pooled)



# 602p ----
# stargazer ----
# R은 기본적으로 출력 결과를 text로 출력하는데, 출력 결과를 문서에 테이블 형태로 삽입하기 위해서는 별도의 작업이 필요하다.
# 출력 결과를 보고서나 논문에서 바로 사용할 수 있도록 완성도 높은 테이블로 바꿔줄 때 stargazer를 사용한다. 

if (!require(stargazer)) install.packages('stargazer')

library(stargazer)

data(mtcars)

head(mtcars)

stargazer(mtcars, type='html', title='Descriptive Statistics',
          digits = 1, out='cars.html')

# flip=TRUE 를 하게되면 index와 column의 위치를 바꿔준다. Transform
stargazer(mtcars, type='html', title='Descriptive Statistics',
          digits = 1, out='cars.html', flip=TRUE)

# covariate.labels
# 변수명을 사용하지 않고, 이해하기 쉬운 명칭을 사용할때 사용한다.

stargazer(mtcars[c('mpg', 'hp', 'wt')], type='html', title='Descriptive Statistics',
          digits = 1, out='cars.html',
          covariate.labels = c('Mile per gallon', 
                               'Gross horsepower', 
                               'Weight (1000 lbs)'))

# summary = FALSE
# 요약통계량이 아닌 데이터프레임 내용 자체를 테이블 형태로 출력하기 위함.

stargazer(mtcars, type='latex', summary = FALSE, title='Descriptive Statistics', 
          digits =1, out = 'cars.html')

# correlation matrix ----
stargazer(cor(mtcars), type = 'latex', title = 'correlation Matrix', 
          digits = 1, out = 'cor.html')


# regression table ----

mtcars$highmpg <- factor(mtcars$mpg > mean(mtcars$mpg))
mtcars$gear <- factor(mtcars$gear)
mtcars$am <- factor(mtcars$am)
m1 <- lm(mpg~disp, data = mtcars)
m2 <- lm(mpg~disp + drat, data=mtcars)
m3 <- with(mtcars, lm(mpg~disp+drat+gear))
m4 <- glm(highmpg~disp+drat+am, family=binomial(link='logit'), data=mtcars)


# omit.stat : 출력에 제외할 통계량 
# LL = Log Likelihood, ser = ser, residual standard error, f = F statistic
# no.space = TRUE, 빈 라인을 제거해준다.
# dep.var.labels, covariate.labels 는 label을 지정해주는 것.
stargazer(m1, m2, m3, m4, type='html', title = 'Model Comparison', out = 'cars.html',
          dep.var.labels = c('Miles per gallon', 'High MPG car'),
          covariate.labels = c('Displacement (cu.in.)', 
                               'Rear axle ratio', 
                               'Four gears', 
                               'Five gears',
                               'Transmission (manual=1)'),
          omit.stat=c('LL', 'ser', 'f'), no.space=TRUE)


# single.row = TURE, CI와 p-value를 같은 줄에 표시해도 되는가?
# ci : confidence interval 신뢰구간 설정.
stargazer(m1, m2, m3, type='html', title = 'Model Comparison', out = 'cars.html',
          dep.var.labels = 'Miles per gallon',
          covariate.labels = c('Displacement (cu.in.)', 
                               'Rear axle ratio', 
                               'Four gears', 
                               'Five gears'
          ),
          omit.stat=c('LL', 'ser', 'f'),  ci=TRUE, ci.level=0.95, single.row=FALSE)


# type = 'text' 로하면 ASCII text형태로 출력이 된다. 
stargazer(m1, m2, m3, type='text', title = 'Model Comparison', out = 'cars.txt',
          dep.var.labels = 'Miles per gallon',
          covariate.labels = c('Displacement (cu.in.)', 
                               'Rear axle ratio', 
                               'Four gears', 
                               'Five gears'
          ),
          omit.stat=c('LL', 'ser', 'f'),  ci=TRUE, ci.level=0.95, single.row=FALSE)



