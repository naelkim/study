# 9월 6일
# 과제 메일 : dlaadudwlss @ naver.com
#            munwon96@naver.com

# knit 누르면 RMD, knit 있는데 RMD만 내라.
# matrices

matrix(1, nrow = 2, ncol = 3) # 1 로 전부!
matrix(1, nrow = 3, ncol = 3) 
?matrix
x = matrix(1:6, nc = 2) 
nrow(x) ;ncol(x) ;dim(x)
dim(x)[1]
dim(x)[2]

cbind(1:3,4:6)
rbind(1:3,4:6)

rbind(1:2,4:6) # warning  뜨지만 가능
rbind(1:2,1:4) # warning 안뜨고 가능

y<-matrix(1:6,nrow=2)
dimnames(y) <- list(c("First","Second"),c("A","B","C"))
y

a<-matrix(1:12,nr=3)
dimnames(a) <-list(c("First","Second","Third"),c("A","B","C","D"))
a

x

#
s = 0 
for(i in 1:nrow(x)) 
  for(j in 1:ncol(x)) 
    s = s + x[i, j]

s

#
s=0
for(i in 1:5)
  s= s + i
s

#
s = 0
for(i in seq(1,100,2))
  s = s + i
s

#
s = 0
for(i in seq(0,100,7))
  s = s + i
s
#
s = 0
for(i in seq(98,0,-7))
  s = s+i
s

#
t = 0
for(i in seq(100,1000,25))
  t = t + i
t
#
x<-matrix(seq(1:100),10,10) # 10 by 10 matrix

# diag 전부 0으로 바꾸어
for(i in 1:10)
  x[i,i]<-0
x

# 띵진꺼
for(i in 1:ncol(x)){
  for(j in i){
    x[i,j]=0
  }
}
x

# [10,] 전부 0으로 만들어
for(i in 1:ncol(x)){
    x[10,i]=0
  }

x

# 띵진
for(i in 10){
  for(j in 1:ncol(x)){
    x[i,j]=0
  }
}
x


# ㄱ자 0
x<-matrix(1:100,10,10)

for(i in 1){
  for(j in 1:ncol(x)){
    x[i,j]=0
    x[j,ncol(x)]=0
  }
}
x

# 띵진
for(i in 1){
  for(j in 1:ncol(x)){
    x[i,j]=0
    x[j,(i+ncol(x)-1)]=0
  }
}
x

# ㄴ = 0
x<-matrix(1:100,10,10)

for(i in 1){
  for(j in 1:ncol(x)){
    x[j,i]=0
    x[ncol(x),j]=0
  }
}
x

# Homework 2 => ㄷ , ㅁ ,ㅂ 0으로 만들어!!


# ㄷ = 0

x<-matrix(1:100,10,10)

for(i in 1:ncol(x)){
  x[i,1]=0
  x[1,i]=0
  x[ncol(x),i]=0
  
}
x

# ㅁ = 0

x<-matrix(1:100,10,10)

for(i in 1:ncol(x)){
  x[1,i] = 0
  x[ncol(x),i] = 0
  x[i,1] = 0
  x[i,ncol(x)] = 0
}
x

# ㅂ = 0

x<-matrix(1:100,10,10)

for(i in 1:ncol(x)){
  x[i,1] = 0
  x[i,ncol(x)] = 0
  x[ncol(x) / 2,i] = 0
  x[ncol(x),i] = 0
  
  
}
x

