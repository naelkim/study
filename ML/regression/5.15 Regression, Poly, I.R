#5.15 Data ch06RegressionDiagnostics
?qqplot
#density 2개 sample 로 qqplot : 직선이 되면 거의 같은분포
#Algorithm 직접짜서 그리기.
qqplot(rt(50,100),rnorm(100))
#qqnorm 은 x가 y로 정해져있는거얌.


lm2 <- lm(log(Volume) ~ 1 + log(Girth) + log(Height), trees)
opar <- par(mfrow=c(1,2), las=1)
plot(lm2, which=1:2) 
par(opar)

summary(av3 <- aov(breaks ~ wool * tension, warpbreaks)) #var가 많이 달라.
plot(av3,which=1:2)
summary(av3a <- aov(1/breaks ~ wool * tension, warpbreaks)) #equal var를 위해 1/y로 바꿈
plot(av3a,which=1:2)

summary(lm(av3a))

library(MASS)
boxcox(av3) #95% Confidence Interval 다음그림은 확대한 것
boxcox(av3a)

summary(av3e <- aov(log(breaks) ~ tension * wool, warpbreaks))
plot(av3e,which=1:2) #거의 직선


#447p ex.12.1.2
x<-c(5,5,10,10,15,15,20,20,25,25);y<-c(14,12.5,7,5,2.1,1.8,6.2,4.9,13.2,14.6)
plot(x,y) #2차 함수 모형이 적절하다.
lm(y~I(x^2)+x) #x^2 은 I(x^2)으로 해야하낟.
lm(y~poly(x,2,raw=T)) #poly(x,3) : 3차식 까지 해서 모델을 만든다.
#raw=T 를 안해주면 orthogonal 시켜서 나오는거임.
lm(y~poly(x,2))

##직접하면 이렇게.
lm(y~I(x^2)+x)

X<-cbind(1,x,x^2)
b=solve(t(X)%*%X)%*%t(X)%*%y #Beta.hat
X%*%b #Fitted Values.
y-X%*%b #Residuals
sum((y-X%*%b)^2) #SSE
sum((y-X%*%b)^2)/(10 - (2+1)) #S^2

#googling ; Fitting Polynomial Regression !

#lecture-16

#mobility Data 불러서, lecture16 16~25p 
mobility
str(mobility)
