#5.20 Data 
#Ch07 1p
library(EngrExpt) #timetemp 들어있다.
timetemp #type : factor(x2). time=y,temp=x1
lm1 <- lm(time ~ temp, timetemp)
lm1a <- lm(time ~ type + temp, timetemp) #절편 test
lm1b <- lm(time ~ type + temp + type:temp, timetemp) #절편,기울기 test
summary(lm1)
coef(lm1b)
coef(summary(lm1b))

#그림과 같이 비교
anova(lm1, lm1a) #p-value = 0 절편이 완전히 다름
anova(lm1a, lm1b) #기울기,절편 p=0.07 절편은 완전히 다르지만, 기울기는 크게 차이 않나므로 0.07 정도

?drop1 #k=2 : AIC 
drop1(lm1b) #AIC 작은 풀모델이 더 좋다. (-4.2935)
drop1(lm1b,test="F") #5p 잘 읽어봐라
drop1(lm1b, test="F", k=log(df.residual(lm1b) + lm1b$rank))
#n-(p+1) 를 n-(p+1) + (p+1) 로 쓰면 더 안정적?? 읽어봐..

#Mallow's Cp
swiss
str(swiss)
printCoefmat(coef(summary(lm2 <- lm(Fertility ~ ., swiss))))
printCoefmat(coef(summary(mod <- step(lm2)))) #examination 빼야 AIC 낮다.

?drop1 #scale 에
drop1(lm2, scale=deviance(lm2)/df.residual(lm2))
#scale= 저거 Cp(k) 와 같음.
#scale 에 넣는 값에 따라 test가 바뀜.

deviance(lm2)
df.residual(lm2)
deviance(lm2)/df.residual(lm2)
