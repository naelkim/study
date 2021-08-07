#9.9

# Data Structure 1

x <- c(4,7,2,10,1,0)
which(x>=4)
x[which(x>=4)]
x[c(1,2,4)]
x[c(2,4)]
x[x>=7]
x[x%%2==0] # 2로 나눈 나머지 = 0 짝수 !
x[x%%2==1] # 홀수

x[which.max(x)]
max(x)
which.min(x)
rank(x) # 작은것 부터 순서대로
order(x) # 제일 작은것부터 몇번째에 있는지
sort(x) # 작은수 -> 큰수 로 나열
?sort
sort(x,decreasing=T) # 큰수 -> 작은수

sum(x) # 합
prod(x) # 곱
cumsum(x) # Cumulative Sum
cumprod(x) # Cumulative Product
min(x) # 최소
max(x) # 최대
mean(x) # 평균
median(x) # 중앙값
fivenum(x)

length(x)
rev(x) # 반ㄷ

A <- matrix(1:4, nrow=2) 
B <- matrix(1, nrow=2, ncol=2)
A * B # 곱
A%*%B # 행렬 곱

y <- 1:3
y %*% y # 내적

A / c(y%*%y) # c()를 안해주면 오류

diag(5) # 5 by 5 I대
x <- matrix(1:12,nrow=3,ncol=4)

apply(x,1,sum) # 행 합
apply(x,2,sum) # 열 합
apply(x,2,mean) # 열 평

x <- 1:10
(x%%2==0) | (x>5) # OR
(x%%2==0) | (x%%3==0) # 2나 3의 배수
x[(x%%2==0)|(x%%3==0)] # 2나 3의 배수를 표현

x <- 1:100
x[ (x%%5==0) & (x%%15!=0) ] # 5의배수 , 15의배수 아닌
x[ (x%%6==0) & (x%%8==0)] # 24 의 배수
mean(x[ (x%%6==0) & (x%%8==0)]) # 그것의 평균 !

x<-1:10
y<-5:15
x%in%y   # 안에 있는지
any(x>5) # 5보다 큰것이 하나라도 있는지
all(x>5) # 전부 5보다 큰지


# if+ and + for + 1

x <-  c(1:10)

for(i in 1:length(x)){
  if(x[i] > 8){
    x[i] <- 0
  }
  
}
x  # 8보다 큰것 ==0

x<- matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(i==j) x[i,j]=0
  }
}

x
# diag(x) = 0

x<- matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(i==j | (i+j)==11) x[i,j]=0
  }
}
x # X 자 로 0

x<- matrix(1:100,10)


for(i in 4:7){
  for(j in 1:ncol(x)){
    if((i+j)==11) x[i,j]=2
  }
}
x


for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(i==1|i==10|j==1|j==10)x[i,j]=0
  }
}
x

x<- matrix(1:100,10)

x[1,]=0;x[10,]=0;x[,1]=0;x[,10]=0
x


for(i in 1:ncol(x)){
  for(j in 1:ncol(x))
    if(i==10|i==ncol(x)/2|j==1|j==10) x[i,j]=0
}
x
