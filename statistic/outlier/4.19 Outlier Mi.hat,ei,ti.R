#4.19
#501p data
y<-c(22.6,15,78.1,28,80.5,24.5,20.5,147.6,4.2,48.2,20.5)
x1 = c(4,2,20,6,6,3,4,16,4,6,5)
x2 = c(44,33,80,24,227,20,41,187,19,50,48)
x3 = c(18,15,80,21,50,18,13,137,15,21,17)
lm(y~x1+x2+x3)
rstandard(lm(y~x1+x2+x3)) #lecture20 16p
#m(-1)(x1) 구해봐 column이 아니라 row를 뺀다.
#hatvalues는 diagonal만 준다.
x<-cbind(1,x1,x2,x3)
b=solve(t(x)%*%x)%*%t(x)%*%y

yi<-y[-1]
xi<-x[-1,]
bi<-solve(t(xi)%*%xi)%*%t(xi)%*%yi
yi.hat=x%*%bi #xi가 아니라 x를 써야되. 1번째 row뺀 yi.hat
#의미 : 1번째 데이터 뺴고, x1의 값을 추정하는 것.
#lecture20 13p 관련.
predict(lm(y~x1+x2+x3))


rstudent(lm(y~x1+x2+x3)) #df = (11-1) - (3+1) =(n-1) - (p+1) = 6
#t(6)값 - 1.94 
?qt
#Homework (34)이용하는게 t값 구하기 편하다. (35) ri는 (29)값
#(33,34,35) 다 짜봐 반페로니?써서 t값보다 큰것은 outlier 표시 하기. ti, t 값
hatvalues(lm(y~x1+x2+x3))[1]
hat(lm(y~x1+x2+x3))
H=x%*%solve(t(x)%*%x)%*%t(x)
Hi=x%*%solve(t(xi)%*%xi)%*%t(xi)
#H(-i) mat을 구하는 방법은 위와 같다.
mi.hat=(H%*%y-hatvalues(lm(y~x1+x2+x3))[1]*y[1])/(1-hatvalues(lm(y~x1+x2+x3))[1]) 
#mi.hat(-i)(xi) = yi.hat 확인
ei=y-mi.hat #(31) ei(-i)
SSE=sum((ei)^2)
n=length(y);p=ncol(x)-1
Si=SSE/(n-p-2) # df= (n-1) - (p+1)
t=ei[1]/(Si*sqrt(1+t(x[1,])%*%solve(t(xi)%*%xi)%*%x[1,]))
#t=ei/(Si*sqrt(1+t(x)%*%solve(t(xi)%*%xi))%*%x))

for (i in 1:11){
  y<-c(22.6,15,78.1,28,80.5,24.5,20.5,147.6,4.2,48.2,20.5)
  x1 = c(4,2,20,6,6,3,4,16,4,6,5)
  x2 = c(44,33,80,24,227,20,41,187,19,50,48)
  x3 = c(18,15,80,21,50,18,13,137,15,21,17)
  x<-cbind(1,x1,x2,x3)
  b=solve(t(x)%*%x)%*%t(x)%*%y
  H=x%*%solve(t(x)%*%x)%*%t(x)
  
  mi.hat=(H%*%y)-hatvalues(lm(y~x1+x2+x3))[i]*y[i]/(1-hatvalues(lm(y~x1+x2+x3))[i])
  ei=y-mi.hat
  SSE=sum((ei)^2)
  n=length(y);p=ncol(x)-1
  Si=SSE/(n-p-2)
  xi=x[-i,]
  t=ei[i]/(Si*sqrt(1+t(x[i,])%*%solve(t(xi)%*%xi)%*%x[i,]))
print(t)
  } #(33)


eii=y-x%*%b
eii/((Si)*sqrt(1-diag(H))) #34
#다르네 시팔..

SSe=sum(eii^2)
S=sqrt(SSe/(n-p-1))
diag(H)
r=eii/(S*sqrt(1-diag(H)))

r*sqrt((n-p-2)/(n-p-1-r^2)) #35
