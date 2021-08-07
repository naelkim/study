# 9.18 

# if for -> 11p

# 361 p  #13
x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)
y<-c(2.39,2.56,2.36,2.62,2.51,2.29,2.58,2.41,2.86,2.49,2.33,1.94,2.14)

min(x);max(x);sd(x);var(x);range(x);length(x)


# 평균보다 작은 값 -> 0 으로 변경
m = mean(x)
for(i in 1:length(x)){
  if(x[i] <  m){ x[i] <- 0}
  }
x

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)
m = mean(x)
# 평균보다 작은 값 -> 0 , 큰 값 -> 1

for(i in 1:length(x)){
  if(x[i]<m) x[i]<-0 else x[i]<-1
}

x

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

m=mean(x)

for(i in 1:length(x)){
  if(x[i] < m){
    x[i] <- 0
  } 
  else {
  x[i] <- 1
  }
}
x

# x < 1.5 : 0  // 1.5 <= x < 1.8 : 1 // 1.8 <= x : 2

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

# 틀린 이유 : else if 가 만족 못할 시를 수식하는데, 만족 할 때의 조건까지 포함이 되었다.

for(i in 1:length(x)){
  if(1.8<=x[i]){
    x[i] <- 2
  }
    else if(1.5<=x && x<1.8){x[i]<-1}
    else if(0<x %% x<1.5){x[i]<-0}
  
}
x

# 이렇게 ㄱㄱ

for(i in 1:length(x)){
  
  if(x[i]<1.5){x[i] <- 0}
  else if(x[i]>=1.5 && x[i]<1.8){x[i]<-1}
  else {x[i]<-2}

  }
x

# 이것도 가능은 해 : 순서를 잘 안맞추어주면, (#2 <-> #3 )안되 !

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

for(i in 1:length(x)){
  
  if(x[i]>=1.8){x[i]<-2}                #1
  if(x[i]<1.5){x[i]<-0}                 #2
  if(x[i]>=1.5 && x[i]<1.8){x[i]<-1}    #3
  
}
x

# x > 1.9 : 3

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)


# 다시 !
for(i in 1:length(x)){
  if(x[i]<1.5){x[i] <- 0}
  else if(x[i]>=1.5 && x[i]<1.8){x[i]<-1}
  else if(x[i]>=1.8 && x[i]<1.9){x[i]<-2}
  else{x[i]<-3}
}

x

##

ss<-function(x){
  for(i in 1:length(x)){
    if(x[i]<1.5){x[i] <- 0}
    else if(x[i]>=1.5 && x[i]<1.8){x[i]<-1}
    else if(x[i]>=1.8 && x[i]<1.9){x[i]<-2}
    else{x[i]<-3}
  }
cat("Answer is \n",x)  
}

ss(x)

# x.bar , s^2 

# mean(x)
x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

m <- function(x){
  s=0
  for(i in 1:length(x)){
    s<- s + x[i]
  }
  cat("mean is ",s / length(x))
  
}
m(x)

# s^2

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

s<-function(x){
  a = 0
  for(i in 1:length(x)){
    a <- a + (x[i] - mean(x))^2
    
  }
  b = a / (length(x)-1)
  sqrt(b)
}
s(x)
sd(x)

# Homework 4 : range sum product median sd

x<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)

rangee<-function(x){
  c(min(x),max(x))
}
rangee(x)
range(x)

summ <- function(x) {
  s = 0
  for(i in 1:length(x)){
    s <- s + x[i]
    
  }
  s
}
summ(x)
sum(x)

prod(x)
prodd<-function(x){
  s = 1
  for(i in 1:length(x)){
    s<- s * x[i]
  }
  s
}
prodd(x)

median(x)
sort(x)

mediann <- function(x){
  n = length(x)
  xx = sort(x)
  if(n%%2==0){(xx[(n/2)]+xx[(n/2)+1])/2}
  if(n%%2==1){xx[(n+1)/2]}
}
median(x)
mediann(x)

sdd<-function(x){
  a = 0
  for(i in 1:length(x)){
    a <- a + (x[i] - mean(x))^2
    
  }
  b = a / (length(x)-1)
  sqrt(b)
}
sdd(x)
sd(x)



