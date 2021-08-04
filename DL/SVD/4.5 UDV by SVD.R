#4월 5일 기계학습 SVD
a<-matrix(c(3,-1,1,3,1,1),2,3)

U=eigen(a%*%t(a))$vectors
V=eigen(t(a)%*%a)$vectors

svd(a) #Singulr Value Decomposition
svd(rbind(c(3,1,1),c(-1,3,1))) 
#부호는 바뀌기도하는데 상관 없다.->이유는 다음시간
#이유 : $u,$v 전부 부호가 바뀌어서 곱하면 같아지넴. 
names(svd(a))
svd(a)$d[1]
svd(a)$d[2]
D=matrix(c(svd(a)$d[1],0,0,svd(a)$d[2]),2,2)
#v는 마지막꺼 000을빼버렷어. 그래서계산에서 조금바꾼다.(원래는 3*3->3*2)
(svd(a)$u)%*%(D)%*%t(svd(a)$v)
#D의 3열c(0,0),v의 3열이 안나와있지만, D[,3]=c(0,0)이기 때문에 위의 계산으로 a가 나온다.

#diag 로 만들어보자. 선재꺼 D=diag(svd(a)$d,2,2)가능.
D0=diag(svd(a)$d,2,2)

svd(a)$u[,1];svd(a)$v[1,]
svd(a)$d[1]*(svd(a)$u[,1])%*%t(svd(a)$v[,1])+ svd(a)$d[2]*(svd(a)$u[,2])%*%t(svd(a)$v[,2]) 
#a = sigma1 * u1%*%t(v1) + sigma2 * u2%*%t(v2) + sigma3 * u3%*%t(v3) ...

#homework5-1 488p 12.1 y빼고 x1~x5 (10*5) 
#(Example) singularvalue 1,2,3,4,5 합=15 의80% 12 =3+4+5 를 포함 1,2는버려 되 function으로 짜라.

#singular 21p
a1<-c(2,1,5,7,0)
a2<-c(0,6,0,0,10)
a3<-c(8,0,7,8,0)
a4<-c(6,1,4,5,0)
a5<-c(0,7,0,0,7)

A<-cbind(a1,a2,a3,a4,a5)

#$v는 vT로 나오는거임 ㅅㅂ;; 오바마..
svd(A)
D1=diag(svd(A)$d,5,5)
(svd(A)$u)%*%(D1)%*%t(svd(A)$v)
#D1^2 =eigenvalue

D1[1,1]*svd(A)$u[,1]%*%t(svd(A)$v[,1])+D1[2,2]*svd(A)$u[,2]%*%t(svd(A)$v[,2]) #실패 사진찍은걸로 다시!
D1[1,1]*svd(A)$u[,1]%*%t(svd(A)$v[,1])+D1[2,2]*svd(A)$u[,2]%*%t(svd(A)$v[,2])+D1[3,3]*svd(A)$u[,3]%*%t(svd(A)$v[,3])
D1[1,1]*svd(A)$u[,1]%*%t(svd(A)$v[,1])+D1[2,2]*svd(A)$u[,2]%*%t(svd(A)$v[,2])+D1[3,3]*svd(A)$u[,3]%*%t(svd(A)$v[,3])+D1[4,4]*svd(A)$u[,4]%*%t(svd(A)$v[,4])
D1[1,1]*svd(A)$u[,1]%*%t(svd(A)$v[,1])+D1[2,2]*svd(A)$u[,2]%*%t(svd(A)$v[,2])+D1[3,3]*svd(A)$u[,3]%*%t(svd(A)$v[,3])+D1[4,4]*svd(A)$u[,4]%*%t(svd(A)$v[,4])+D1[5,5]*svd(A)$u[,5]%*%t(svd(A)$v[,5])

a <- matrix(0,5,5)
for(i in 1:5){
  k=D1[i,i]*svd(A)$u[,i]%*%t(svd(A)$v[,i])
  a=a+k
  }
a  
A

#교재에서는 3개넣음 2개로도 충분히 approximatio된거야

#svmcs168l9

#다음시간에 Degree Of Freedom 486p Mallows Ck Statistic,Press Statistic관련
