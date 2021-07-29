#4.17 Data
#3.29file / 4.15outlier
fit <- lm(mpg ~ wt, data=mtcars)
hatvalues(fit) #Hii
head(mtcars)
summary(mtcars)
nrow(mtcars) #32개 data
4/32 #p+1 / n (p=1,n=32)보다 큰 값은 outlier일 확률이 커
which.max(hatvalues(fit)) #which.max써서 찾기. 
which(hatvalues(fit)>0.125)
lm.influence(fit)$hat 
#lm.influence(fit)$sigma = sigma.hat(-i) 씹이득
rstandard(fit) #studentized residaul (ri)
residuals(fit)/(sqrt(1-hatvalues(fit))*sigma(fit)) #studentized residaul (ri)
rstudent(fit) #extrenally studentized residual (ti)
