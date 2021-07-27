#3월 4일 11,12장, anova, factory experiment, linear 중간고사 / 회귀,데이터줄이기 

matrix(1:6,nrow=3)
matrix(6:1,nrow=3)
# 3 6,2 5,1 4 만들어봐!
cbind(c(3,2,1),c(6,5,4))

rbind(c(1,2),1:3)
x=matrix(1:6,nrow=2)
dimnames(x)=list(c("First","Second"),c("A","B","c"))
x
x = matrix(1:12, nrow = 3, ncol = 4) 
x
x[1:2,c(2,4)]
x[1:2, c(2, 4)] = 21:24 
x[2:1, c(2, 4)] = 21:24
x
#3의 배수들을 전부 10으로 바꿔봐.
x<-matrix(1:12,nrow=3)
x[3,1:4]=10
x #위치를 이용해서
#if,for를 써서 해봐!
x[row(x) < col(x)] = 0
x
#역 대각선을 바꿔라.
x = matrix(3, nrow = 4, ncol = 4) 
x
x[row(x)==-col(x)+5]=1
x

#대각선 아래는 0, 나머진 1~10 만들어봐 , if문 써서해봐.
x=matrix(0,nrow=4,ncol=4)
x[row(x) >= col(x)]=1:10
x
t(x)

x = matrix(1:4, nrow = 2, ncol = 2)
x
x+x^2
x+1
x+1:2
x+rep(1:2,each=2,1)

#~19p 까지학습.
