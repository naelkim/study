# 9.11 

# 전산통계1  14p

stand <- function(x){
  cat(sqrt(var(x)), ",",mean(x))
}

x<-c(9,5,2,3,7)
stand(x)
sd(x)

mean(x)
?sd

# 10의배수 = 2 , 5의 배수 = 0 으로 대체
x = matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%5==0){
      ifelse(x[i,j]%%10==0,x[i,j]<-2,x[i,j]<-0)
      
      }
    }
    
  }

x

# -second : 잘못된 방법.
# 이유 : if 문 내부에 elseif 가 아닌 if 를 돌리면, [5,] -> 0 으로 바뀐 후, 다시 2로
x = matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%5==0){
      x[i,j] <- 0
      if(x[i,j]%%10==0){x[i,j]<-2}
      
    }
  }
  
}

x

# -third : 차라리 독립적인 if 문 2개를 사용
# 하지만 5로 나누는 구문이 먼저 나온다면, 0으로 바뀐 뒤라, 전부 <- 2

x = matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%10==0){
      x[i,j]<-2}
    if(x[i,j]%%5==0){
      x[i,j] <- 0
      
    }

  }
  
}

x




# 3의 배수 = 0  , 6의 배수 = 1 ,9의 배수 = 2

x <-matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%9==0){
      x[i,j]<-2
      
    }
    else if(x[i,j]%%6==0) {x[i,j]<-1}
    else if(x[i,j]%%3==0) {x[i,j]<-0}
    
    
  }
} # 9부터 바꾸고 시작해 !
x

# else if 안쓰고 하는 방법.

x<- matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%9==0){
      x[i,j] <- 2
    
    }
    if(x[i,j]%%6 ==0 ) {x[i,j] <- 1}
    if(x[i,j]%%3 ==0 ) {x[i,j] <- 0}
    
    
  }
}

x



7%%3
# 4로나눈 나머지 0,1,2,3 -> 0,1,2,3,

x<-matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%4==0){x[i,j]<-0}
    if(x[i,j]%%4==1){x[i,j]<-1} #else if도 되!
    if(x[i,j]%%4==2){x[i,j]<-2}
    if(x[i,j]%%4==3){x[i,j]<-3}
  }
}
x


#  각각 x+5 ,x^2 , x+4x^2 2x

x<-matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%4==0){x[i,j]<-x[i,j]+5}
    if(x[i,j]%%4==1){x[i,j]<-x[i,j]^2} 
    if(x[i,j]%%4==2){x[i,j]<-x[i,j]+4*x[i,j]^2}
    if(x[i,j]%%4==3){x[i,j]<-2*x[i,j]}
  }
}
x

# 3으로 나눠서 0,1,2 => 0->제곱 ,1->앞의숫자 , 2->뒤의숫자
# 1->1

x<-matrix(1:100,10)

for(i in 1:ncol(x)){
  for(j in 1:ncol(x)){
    if(x[i,j]%%3==0){x[i,j]<-x[i,j]^2}
    if(x[i,j]%%3==1){x[i,j]<-x[i,j]-1} #else if도 되!
    if(x[i,j]%%3==2){x[i,j]<-x[i,j]+1}
    x[1,1]<-1 ;x[10,10]<-100
    
  }
}
x


# 00000000001
#          0
#       0  
#     0   
#   0    
# 0
#200000000000

x<-matrix(1:100,10)

for(i in 1:ncol(x)){
    x[1,i] <- 0
    x[i,11-i] <- 0
    x[10,i] <- 0
    x[1,10] <-1 ;x[10,1]<-2
    
}
x


#띵진
#x<-matrix(1:100,10)
#for(i in 1:ncol(x)){
#  for(j in 1:ncol(x)){
#    if(i==1) {x[i,j]<-0}
#    if(i==ncol(x)) {x[i,j]<-0}
#    if(i+j==ncol(x)+1){
#      x[i,j]<-0
#      if(x==1) {x[i,j]<-1}
#      else if(i==ncol(x)) {x[i,j]<-2}
#      
#    }
#    
#  }
#}




#Homework3 X( 000 ,111) ,Y(000 000 11) (11by11)자를 0으로 만들어 !!(2문제)