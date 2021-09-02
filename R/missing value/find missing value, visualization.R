
# missing value

# is.na() ----
# NA 값을 TRUE로 반환한다.
x <- c(1, 2, 3, NA)
is.na(x)

x[!is.na(x)]

# complete.cases() ----
# na.omit()
# 행렬이나 데이터프레임에서 결측값이 포함되지 않은 행을 식별한다.
# 누락된 관측값이 없는 행에 대해서는 TRUE를 반환하고, 하나라도 결측치가 있으면 FALSE를 반환한다.


str(airquality)

# complete.cases() == na.omit()
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


# md.pattern() ----
# 출력되는 0과 1은 결측값과 비결측값을 보여준다.
# 1인 경우 결측값이 전혀 없는 패턴
# 왼쪽의 숫자는 패턴의 개수
# 오른쪽의 숫자는 결측값이 발생한 변수의 개수 
# 아래의 값은 해당 열의 결측치 수

md.pattern(airquality)

# VIM package ----

















