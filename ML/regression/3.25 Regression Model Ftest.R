#3월25일 452p래 승진아.. SSR Bhat 먼저구하고, 

#이 Multiple regression model 이 적절한지?
#H0:Beta1=Beta2=0 Ha:not H0
y<-c(17.9, 16.5, 16.4, 16.8, 18.8, 15.5, 17.5, 16.4, 15.9, 18.3)
x1<-c(1.35, 1.90, 1.70, 1.80, 1.30, 2.05, 1.60, 1.80, 1.85, 1.40)
x2<-c(90,30,80,40,35,45,50,60,65,30)

y<-as.matrix(y)
x<-cbind(1,x1,x2)

b<-solve((t(x)%*%x),(t(x)%*%y)) #Bhat 먼저!
n=nrow(x);p=ncol(x)-1
SSR=t(b)%*%t(x)%*%y-n*((sum(y)/n)^2)
Syy=sum((y-mean(y))^2); SSE=Syy-SSR #SSE=t(Y-X%*%B)%*%(Y-X%*%B)로하는것도 좋고.
fstar<-(SSR/p)/((SSE/(n-p-1)))
pvalue<-pf(fstar,p,n-p-1,lower.tail=F) 
SSR
pvalue
fstar #pvalue<0.05 H0기각 ->모형이 적절하다!

#501p H0: (beta1,beta3=0) reduced model is appropriate 을 test! 과제3에2번.

y<-c(22.6,15,78.1,28,80.5,24.5,20.5,147.6,4.2,48.2,20.5)
x1<-c(4,2,20,6,6,3,4,16,4,6,5)
x2<-c(44,33,80,24,227,20,41,187,19,50,48)
x3<-c(18,15,80,21,50,18,13,137,15,21,17)
x<-cbind(1,x1,x2,x3)
xr<-cbind(1,x2)
b=solve(t(x)%*%x,t(x)%*%y)
b
br=solve(t(xr)%*%xr,t(xr)%*%y)
SSEf=t(y-x%*%b)%*%(y-x%*%b)
SSEr=t(y-xr%*%br)%*%(y-xr%*%br)
SSEr;SSEf
n=nrow(x); p=ncol(x)-1;m=2

fstar<-((SSEr-SSEf)/(p-m))/((SSEf/(n-p-1)))
pvalue<-pf(fstar,p-m,n-p-1,lower.tail=F) 
#pvalue = 0.0002 <0.05 reject H0 ->reducing beta1,beta3 model is not appropriate!
