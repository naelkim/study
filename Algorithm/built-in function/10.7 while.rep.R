# 10.7

# Google : repeat r while break

#
x<- 1:5
for(val in x){
  if(val == 3){
    break
  }
  print(val)
}

#
x<-1:5
for(val in x){
  if(val == 3){
    next
    
  }
  print(val)
}

#
i = 1
while(i<10){
  result = i * 2
  print(result)
  i = i + 1
}

# 20 까지

i = 1
result= 0
while(result<20){
  result = i * 2
  print(result)
  i = i + 1
}

# repeat
i = 1
repeat{
  result=i*2
  if(result>20) break
  print(result)
  i=i+1
}

# 15의 배수 3번 나오면 stop

i = 1
repeat{
  if(i/15>3) break
  print(i)
  i = i+1
}

# 1 , 1+2 , 1+2+3 , ... 중에 100~200 만 출력

i = 1
repeat{
  result = sum(1:i)
  if(result>=100 && result<=200 ){print(result)}
  i = i+1
}

# 실패 ~!!
i = 1
result= 0
while(result<200){
  result <- sum(1:i)
  if(result>=100){print(result)}
  i = i + 1
}

#
i = 1 ;result = 0
while(result>200){
  result = i * (i+1)/2
  if(result>100) print(result)
  i + i+1
}

#
i = 1 ;result = 0
while(result<200){
  if(result>100)print(result)
  i = i+1
  result = i * (i+1) / 2
}

# Mat
A <- matrix(1:4, nrow=2) 
B <- matrix(1, nrow=2, ncol=2) 

A %*% B
C = matrix(nrow=2,ncol=3) # 빈 mat
t(c(2,1,1))%*%c(1,2,2)

A;B
A[1,]*B[,1]
A%*%B

mat.prod <- function(A,B){
  m = nrow(A) ; n = ncol(A) ; l = ncol(B)
  s = matrix(0,m,l)
  for(i in 1:m){
    for(j in 1:l)
      s[i,j] <- sum(A[i,]*B[,j] )
      
  }
  
  print(s)
  
}
all.equal(s(A,B) , A%*%B )
?sample # 반복, 확률 을 넣어줄 수 있다.
sample(1:10,5,T) # 반복해서 나올 수 있다.

A <- matrix(sample(1:100,150,T),10,15)
B <- matrix(sample(1:100,300,T),15,20)
mat.prod(A,B)








