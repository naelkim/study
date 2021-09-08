# summarize

# Categorical variable ----

if (!require('MASS')) install.packages(MASS)
library(MASS)

str(survey)

# 레벨을 가지는 factor형 변수이다.
# table ----
levels(survey$Smoke)

frqtab <- table(survey$Smoke)
frqtab

class(frqtab)

frqtab[2]

frqtab==max(frqtab)


frqtab[frqtab==max(frqtab)]

names(frqtab[frqtab==max(frqtab)])


# which.max ----
which.max(frqtab) # max value의 위치에 대한 값을 반환해준다.

frqtab[which.max(frqtab)]

names(frqtab[which.max(frqtab)])


# prop.table ----
frqtab.prop <- prop.table(frqtab)

frqtab.prop['Never']


# broadcasting 해서 계산이 된다.
frqtab.prop * 100


# 상대적 빈도, 비율을 구할 수 있다.
sum(survey$Smoke == 'Never', na.rm = TRUE) / length(survey$Smoke)

mean(survey$Smoke == 'Never', na.rm=TRUE)

anorexia

mean(anorexia$Postwt > anorexia$Prewt)

# 정규분포에서 2 sigma 보다 멀리 있는 건 대충 99% 밖에 있다고 표현한다.
mean(abs(mammals$brain - mean(mammals$brain)) > 2*sd(mammals$brain))

# diff ----
# diff 함수는 주어진 벡터로부터 연속된 두 숫자의 차이를 계산하여 반환한다. 
mean(diff(SP500) > 0)



if (!require('vcd')) install.packages('vcd')
library(vcd)

# 류마티스 관절염 데이터 
str(Arthritis)

crosstab <- table(Arthritis$Improved, Arthritis$Treatment)
crosstab

crosstab['Marked', 'Treated']

?xtabs
# xtabs ----
crosstab <- xtabs(~ Improved + Treatment, data = Arthritis, sparse = FALSE)
crosstab


# margin.table ----
crosstab
# margin = 1 : row  / 2 : column
margin.table(crosstab, margin=1)

# 동일하다 margin이 생략된거.
prop.table(crosstab, 2)

# margin을 하지 않으면 전체 비율로 된다.
prop.table(crosstab)


# addmargins ----
addmargins(crosstab, margin = 1)


# 비율의 교챠표에 addmargins 함수를 적용하면 sum column 까지 제공해주어 편하다.
prop.table(crosstab, 2)

addmargins(prop.table(crosstab, 2), 1)

addmargins(prop.table(crosstab, 2), 2)


# CrossTable ----
# 다양한 정보를 담고 있는 교차표를 생성할 수 있다. 
if (!require('gmodels')) install.packages("gmodels")
library(gmodels)

# dnn 안에서 행의 이름과 열의 이름을 지정해줄 수 있다. 
# CRBD?
# randomized Complete Block Design
CrossTable(Arthritis$Improved, Arthritis$Treatment, prop.chisq=FALSE, 
           dnn = c('Improved', 'Treatment'))

# format : SAS, SPSS
CrossTable(Arthritis$Improved, Arthritis$Treatment, prop.chisq=TRUE, chisq=TRUE, fisher = TRUE, resid=TRUE, 
           dnn = c('Improved', 'Treatment'))



# ftable ----
# 둘다 동일하다.
multtab <- with(Arthritis, table(Improved, Sex, Treatment)) # 마지막에 오는건 두개로 만들어주네.
multtab <- xtabs(~ Improved + Sex + Treatment, data = Arthritis)
multtab

ftable(multtab) # default : row.vars = c(1, 2), col.vars = c(3)


ftable(multtab, row.vars = c(1, 2, 3))

ftable(multtab, row.vars = c(1, 2))

ftable(multtab, col.vars = c(1, 2))

ftable(multtab, col.vars = c(1, 2, 3))


# 3차원 확장
margin.table(multtab, 1)

margin.table(multtab, 2)

margin.table(multtab, 3)

margin.table(multtab, c(1, 3))























