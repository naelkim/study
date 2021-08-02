#3월 27일 477p ex12.5.2

y<-c(17.9, 16.5, 16.4, 16.8, 18.8, 15.5, 17.5, 16.4, 15.9, 18.3)
x1<-c(1.35, 1.90, 1.70, 1.80, 1.30, 2.05, 1.60, 1.80, 1.85, 1.40)
x2<-c(90,30,80,40,35,45,50,60,65,30)

Y<-as.matrix(y)
X<-cbind(1,x1,x2)

#H0 : Beta1=Beta2=0
B<-solve((t(X)%*%X),(t(X)%*%Y)) #Bhat 먼저!
n=nrow(X);p=ncol(X)-1
SSR=t(B)%*%t(X)%*%Y-n*((sum(Y)/n)^2)
Syy=sum((y-mean(y))^2); SSE=Syy-SSR #SSE=t(Y-X%*%B)%*%(Y-X%*%B)로하는것도 좋고.
fstar<-(SSR/p)/((SSE/(n-p-1)))
pvalue<-pf(fstar,p,n-p-1,lower.tail=F) 
SSR
pvalue
fstar

Xr<-cbind(1,x1)

SSEf=SSE
Xr<-cbind(1,x1)
Br=solve(t(Xr)%*%Xr,t(Xr)%*%Y)
Br; m=ncol(Xr)-1;m
SSEr=t(Y-Xr%*%Br)%*%(Y-Xr%*%Br)
SSEr
fstar<-((SSEr-SSEf)/(p-m))/((SSEf/(n-p-1)))
pvalue<-pf(fstar,p-m,n-p-1,lower.tail=F)
SSE;SSEr;fstar;pvalue
cat("pvalue is ",pvalue," < 0.05. reject H0.") #책은40.13 반올림때매 다른거야.


#3.11 LM 파일 열기.

y<-c(17.9, 16.5, 16.4, 16.8, 18.8, 15.5, 17.5, 16.4, 15.9, 18.3)
x1<-c(1.35, 1.90, 1.70, 1.80, 1.30, 2.05, 1.60, 1.80, 1.85, 1.40)
x2<-c(90,30,80,40,35,45,50,60,65,30)
x<-cbind(1,x1,x2)

#473p Beta2=0 방법 해봐.. 아직 미완성. 0이 CI에 들어가면 accept H0 
n=nrow(x);p=ncol(x)-1
b=solve(t(x)%*%x,t(x)%*%y)
SSE=t(y-x%*%b)%*%(y-x%*%b)
S=sqrt(SSE/(n-p-1))
C=solve(t(x)%*%x)
qt(0.975,n-p-1)
alpha<-0.05
b[3,]+qt(alpha/2,n-p-1)*S*sqrt(C[3,3])
b[3,]-qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3])
b[3,]-qt(0.975,n-p-1)*S*sqrt(C[3,3])#3개다 같은표현임ㅋ

b[3,]+qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3])

cat("(",b[3,]-qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3]),",",b[3,]+qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3]),")")


cat("(",b[3,]-qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3]),",",b[3,]+qt(1-alpha/2,n-p-1)*S*sqrt(C[3,3]),")")

#t-test
tstar = b[3]/(S*sqrt(C[3,3]))
tstar^2 # tstar^2= Fstar
cat("tstar is ",tstar,". so, p<0.0005 , we reject H0.") #See 699p

#Confiden Interval for Beta2=0 is ( -0.02027614 , -0.009513893 ). 
#so Beta2 is not 0. x2 is needed in model that already contains the variable x1.

#H0: Beta2 = 0.
xr<-cbind(1,x1)
br<-solve(t(xr)%*%xr)%*%t(xr)%*%y
SSEf=SSE;SSEr=sum((y-xr%*%br)^2);m=ncol(xr)-1
fstar<-((SSEr-SSEf)/(p-m))/((SSEf/(n-p-1)))
pvalue<-pf(fstar,p-m,n-p-1,lower.tail=F) 
#pvalue=0.0003 <0.05. reject H0.  
#So Beta2 is not 0. x2 is needed in model that already contains the variable x1.




#R구해

R=sqrt(SSR/Syy)
R^2

#3.29glmaovlm

lm(y~x1+x2)
lm(formula = y ~ x1 + x2)
lm(y~1+x1+x2)
lm(formula = y ~ 1 + x1 + x2)
X<-cbind(1,x1,x2)
X
lm(y~X)
X<-cbind(x1,x2)
lm(y~X)
X<-cbind(1,x1,x2)
lm(y~x1+x2)$coefficients[3]
lm(y~x1+x2)$coefficients[1]
summary(lm(y~x1+x2)) 
coef(lm(y~x1+x2)) #Beta.hat = Coefficients
resid(lm(y~x1+x2))   #yi-yihat = ei (residual)
df.residual(lm(y~x1+x2)) #Degree of Freedom
fitted(lm(y~x1+x2)) #=yihat =predict(lm(y~x1+x2))
predict(lm(y~x1+x2)) 
deviance(lm(y~x1+x2)) #sum((y-fitted(lm(y~x1+x2)))^2)=SSE=sum((y-x%*%b)^2)
confint(lm(y~x1+x2)) #Confidence Interval.
plot(lm(y~x1+x2)) #Plot

