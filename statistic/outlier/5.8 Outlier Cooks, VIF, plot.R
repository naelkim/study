#5/8 Data
#chapter3 30p~ / linear modelST3131
y= c(56.25,    75,      115.625, 68.75,   96.875, 168.750,  84.375,  171.875, 109.375, 103.125)
x1=c(106.329, 144.726, 136.287, 154.430, 385.232, 585.544, 489.451, 445.992, 270.886, 163.291)
x2=c(90.756,  203.361, 672.269, 183.193, 140.336, 146.218, 184.874, 537.815, 309.244, 190.756)
x3=c(94.650,  131.687, 123.457, 113.169, 117.284, 152.263, 121.399, 150.206, 185.185, 139.918)
x4=c(162.791, 255.814, 191.860, 133.721, 174.419, 273.256, 255.814, 552.326, 534.884, 360.465)
x5=c(114.337, 112.632, 153.684, 116.842,  87.368,  94.737,  95.789, 113.684, 108.421, 106.321)
x6=(0.1*x1+0.2*x2+0.3*x3+x4-10)

mc<-lm(y~x1+x2+x3+x4+x5)
summary(mc)

#x<-cbind(1,x1,x2,x3,x4,x5)
#summary(mc)$sigma
#solve(t(x)%*%x);n=nrow(x);p=ncol(x)-1;b=solve(t(x)%*%x)%*%t(x)%*%y;SSE=sum((y-x%*%b)^2);S=sqrt(SSE/(n-p-1))
#tstar=b/(S*sqrt(diag(solve(t(x)%*%x))))
#pvalue=pt(tstar,n-p-1,lower.tail=F)*2 #beat0 는 다르네..?


md<-lm(y~x1+x2+x3+x4+x5+x6)
summary(md)#이상헌디?

library(car) #vif 여기에있어.

vif(mc)

#r1=summary(lm(x1~x2+x3+x4+x5))$r.squared
#r2=summary(lm(x2~x1+x3+x4+x5))$r.squared
#r3=summary(lm(x3~x1+x2+x4+x5))$r.squared
#r4=summary(lm(x4~x1+x2+x3+x5))$r.squared
#r5=summary(lm(x5~x1+x2+x3+x4))$r.squared
#1/(1-r1);1/(1-r2);1/(1-r3);1/(1-r4);1/(1-r5) #vif(mc) 의 값들.
#vif(x5) >10 이므로 다른값과 연관이되어있어.

vif(lm(y~x1+x2+x3+x4)) #값이 확 줄어들었디.
summary(lm(y~x1+x2+x3+x4)) #variance가 확 줄어들었다. x5가 다른것과 관계가 크게 있었었다.

#37p di(ri),cooks diatance 찾아 / lecture20
#Cooks distance에서
#F(p+1),(n-p-1)(0.1) 보다 크면 leverage가 높은거야
e=summary(mc)$residuals
s=summary(mc)$sigma
x<-cbind(1,x1,x2,x3,x4,x5)
H=x%*%solve(t(x)%*%x)%*%t(x)
diag(H);hatvalues(mc)
d.i=e/sqrt(s^2*(1-diag(H))) #r.i
#t.i
n=length(y);p=ncol(x)-1
t.i=d.i*sqrt((n-p-2)/(n-p-1-d.i^2)) #rstudent
rstudent(mc)
#Cook's Distance
D.i=(1/((p+1)*s^2))*e^2*hatvalues(mc)/(1-hatvalues(mc))^2
cooks.distance(mc)


#17p 그림그려
par(mfrow=c(2,2))
plot(hatvalues(mc),ylab="Leverage",,ylim=c(0.1,1.5))
abline(h=2*(p+1)/length(y), col="red")  #빨간선으로 부터 멀면 outlier  h>2*(p+1)/n
plot(rstandard(mc), ylab="Standardized residuals") 
plot(rstudent(mc), ylab="Cross-validated studentized residuals") 
abline(h=qt(0.025,df=length(y)-2),col="red") 
abline(h=qt(1-0.025,df=length(y)-2),col="blue")  #구간 바깥을 outlier
plot(cooks.distance(mc), ylab="Cook's statistic")  # 6번 잡음 (월등히 위에)
abline(h=qchisq(0.1,2)/2,col="green") 


#Homework5.1 diffits,dfbeta,covratio,cooks.distance 명령어없이 짜서 명령어와 비교해봐!
#(3.29 glmaovlm)

#cooks distance/ ri outlier비교 하기
#Homework5.2 qq.plot
#Homework5.3 Mallow's Ck Statistics. / Press Statistics (486p)