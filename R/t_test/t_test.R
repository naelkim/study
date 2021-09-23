#T test

# t = (x.bar - mean(x)) / (standard error / sqrt(n))
# t-value ( t statistic ) 을 test staticic으로 활용하여 검정한다. 

# 


# chi-squared test

if (!require('devtools')) install.packages("devtools")

devtools::install_github("cardiomoon/webr")

require(moonBook)
require(webr)

# chi-squared test
x=chisq.test(table(acs$sex,acs$DM))
x

plot(t.test(mtcars$mpg, mu=22))

plot(rt(10, 4))
x <- t.test(rt(10, 4))
y <- t.test(rt(10, 9))
z <- t.test(rt(10, 1000))

plot(x, col = 'red')

plot(y, col = 'blue')

plot(z, col = 'green')


##################################################################

pt(3.58, df=19, lower.tail=FALSE) * 2

# 검정통계량을 확인하고 싶을 때 사용한다.
qt(0.005, df = 19, lower.tail = FALSE)

# Sex : 성별
# Bwt : 몸무게 (kg)
# Hwt : 심장무게 (gram)
library(MASS)
str(cats)

t.test(x=cats$Bwt, mu=2.6)

plot(t.test(x=cats$Bwt, mu=2.7))


# one - side test ----
t.test(cats$Bwt, mu=2.6, alternative = 'greater')

t.test(cats$Bwt, mu=2.6, alternative = 'less')


cats.t <- t.test(cats$Bwt, mu=2.6)
str(cats.t)

cats.t$statistic

cats.t$conf.int

cats.t$p.value

t.test(cats$Bwt, mu=2.6, conf.level = 0.99)

# prop.test ----
prop.test(x = 18, n = 30, p = 0.5, alternative = 'greater')


# two - independent t test -----

t.test(formula = Bwt ~ Sex, data = cats)

bars <- tapply(cats$Bwt, cats$Sex, mean)
lower <- tapply(cats$Bwt, cats$Sex, function(x) t.test(x)$conf.int[1])
upper <- tapply(cats$Bwt, cats$Sex, function(x) t.test(x)$conf.int[2])

if (!require('gplots')) install.packages('gplots')

library(gplots)


barplot2(bars, space=0.4, ylim=c(0, 3.0),
         plot.ci=TRUE, ci.l=lower, ci.u=upper, ci.color='maroon', ci.lwd=4,
         names.arg=c('Female', 'Male'), col=c('coral', 'darkkhaki'),
         xlab='Cats', ylab='Body Weight (kg)',
         main='Body Weight by Sex \n with Confidence Interval')

Bwt.f <- cats$Bwt[cats$Sex=='F']
Bwt.m <- cats$Bwt[cats$Sex=='M']

t.test(Bwt.f, Bwt.m)

































































































