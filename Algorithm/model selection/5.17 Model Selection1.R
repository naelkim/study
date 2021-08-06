#Data 5.17
#file Ch07Selection
#ch05
summary(lm1 <- lm(optden ~ 1 + carb, Formaldehyde))
Formaldehyde
str(Formaldehyde) #n=6, variables=2

coef(summary(lm1a <- lm(optden ~ 0 + carb, Formaldehyde))) #(0,0) 지나는 Regression

anova(lm1a,lm1) #pvalue : 0.5516 ; Beta0=0 에 대한 p-value. accept H0. 
#anova는 reduced model 을 앞에 넣어야한다!
anova(lm1,lm1a) #이렇게 반대로 넣어도 결과는 같지만, 해석이 이상해져!

coef(summary(lm1b <- lm(optden ~ 1 + carb + I(carb^2), Formaldehyde)))
coef(summary(lm1c <- lm(optden ~ poly(carb, 2), Formaldehyde))) 
#Orthononalize 된 것(independent)이라 다르다.

trees
str(trees)
coef(summary(lm1c <- lm(optden ~ poly(carb, 2), Formaldehyde)))
coef(summary(lm2 <- lm(log(Volume) ~ log(Girth), trees)))
coef(summary(lm2a <- lm(log(Volume) ~ log(Girth) + log(Height), trees)))
confint(lm2a) #95%Confidence Interval

lm2c <- lm(log(Volume) ~ 1 + offset(2*log(Girth) + log(Height)), trees) #직접 Beta1=2 대입한 것
#offset : Beta 추정하지 말고 여기있는것을 직접 쓴다. Beta0 만 추정

anova(lm2c,lm2a)
#pvalue = 0.8464 데이터 좋다~(lm2c)
#추정치 보다 대입한 모델이 훨신 좋다.

