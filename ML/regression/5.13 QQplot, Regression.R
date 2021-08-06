#5.13 Data

w1<-rt(100,50)
w2<-rnorm(100)
qqplot(w1,w2)
?qqplot

s1<-rt(100,1)
s2<-rt(100,100)
qqplot(s1,w2)
qqplot(s2,w2) #s2가 df가 훨씬 높으므로 거의 직선에 가까운 형태의 qqplot

#t분포에서 df 가 높아질수록 normal에 가까워짐.
#하나가 normal이면 qqnorm 을 쓴다.

chi<-rchisq(100,1)
qqplot(chi,w2)
qqplot(s1,s2)
qqplot(s2,w2)
qqplot(chi,w2^2) #정규분포^2 = chi(1) 에 근사.
qqnorm(s2)
qqline(s2)
#직선에 가까우므로 적절

fit <- lm(mpg ~ wt, data=mtcars)
par(mfrow=c(2,2))
plot(fit)
par(mfrow=c(3,2)) #이거 없애고 보면 하나씩 볼수있ㄷ
plot(fit, which=1:6)

#file ch06Regression Diagnostics

opar <- par(mfrow=c(1,2), las=1)   #las=2 하면 
lm2 <- lm(log(Volume) ~ 1 + log(Girth) + log(Height), trees)
plot(lm2, which=1:2) # Homework6-2 Resiaudls,Fitted values 변경.

summary(av3 <- aov(breaks ~ wool * tension, warpbreaks))
plot(av3,which=1:2)
#variance가 서로달라. 많이퍼져있으므로 점점 증가한거라 볼 수 있다.
#(x값에 따라 variance가 달라서. not equar var. 가정에 맞지않다.)
#equal var로 만들기 위해서 y의 값을 조절해 주어야 한다.

summary(av3a <- aov(1/breaks ~ wool * tension, warpbreaks))
#1/y 를 씀
plot(av3a,which=1:2) #which=1:2 ; 1,2번째만 그린다.
#비교적 equar var가 된다. 어느정도 normarl 가정에 맞아.


