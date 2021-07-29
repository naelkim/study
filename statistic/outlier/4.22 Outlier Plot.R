#4.22

#mobility csv로 열어
#File-Important Dataset-From text(readr)
#4.15file 16p
mob.lm <- lm(Mobility~Commute, data=mobility) 
hatvalues(mob.lm) 
influence(mob.lm)$hat 

rstandard(mob.lm) #(29)
residuals(mob.lm)/sqrt(1-hatvalues(mob.lm))  #(29)
rstudent(mob.lm) #(33) df=n-p-2

#13p (37)크면 outlier 

cooks.distance(mob.lm) #값이크면 이상한겨
par(mfrow=c(2,2)) 
mob.lm <- lm(Mobility~Commute,data=mobility)
plot(hatvalues(mob.lm), ylab="Leverage") #,xlb="":아무것도안침.
abline(h=2/nrow(mobility), col="red") 
#2(n+1)/p 아닌가..?
plot(rstandard(mob.lm), ylab="Standardized residuals") 
plot(rstudent(mob.lm), ylab="Cross-validated studentized residuals") 

abline(h=qt(0.025,df=nrow(mobility)-2),col="red") 
#반페로니 없이2~-2 에서 컷하고싶어.
abline(h=qt(1-0.025,df=nrow(mobility)-2),col="red") 
plot(cooks.distance(mob.lm), ylab="Cook's statistic") 
abline(h=qchisq(0.1,2)/2,col="grey")

mobility[rank(-abs(rstudent(mob.lm)),)<=10,]
#y=mobility, 
mobility[rank(-abs(cooks.distance(mob.lm)))<=10,]
#abs : 가운데로 부터 얼마나 떨어져있는지.

help(plot.lm)
par(mfrow=c(2,2)) 
plot(mob.lm)
#Q-Q는 직선이 나와야 normal 가정이 맞아.
plot(mob.lm,which=1:6) #아무것도안쓰면 4개default
#Cook's distance 봐
par(mfrow=c(3,2))
