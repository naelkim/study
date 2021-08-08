# 10.11
# Data structure 1 - 14p

A <- matrix(1:9,3)
A[1,]
A[1,1:3]

x <- matrix(1:12,3,4)

?apply

apply(x,1,sum)   # 1 : row
apply(x,2,mean)  # 2 : col
apply(x,1,min)

# HW 5 - 2 : matrix - apply funcion(sum,mean 명령어x)

applyy <- function(x,v,ft){
  m = nrow(x) ; n = ncol(x)
   
  if(v == 1){
    
    if(ft == "mean"){
      
      X <- c()
      s <- rep(0,m)
      
      for(j in 1:m){
      for(i in 1:n){
        s[j] <- s[j] + x[j,i]
      } 
        X[j] <- s[j] / n
      }
      
      X
      
    }
    
    
    if(ft == "sum"){
      
      X <- rep(0,m)
      
      for(j in 1:m){
      for(i in 1:n){
          X[j] <- X[j] + x[j,i]
        } 
      }
      
      X
      
    
  }
  
}
  if(v == 2){
    
    if(ft == "mean"){
      
      X <- c()
      s <- rep(0,n)
      
      for(j in 1:n){
      for(i in 1:m){
          s[j] <- s[j] + x[i,j]
      }
        X[j] <- s[j] / m
      }
      
      X
      
    }
      
    if(ft == "sum"){
      
      X <- rep(0,n)
      
      for(j in 1:n){
      for(i in 1:m){
          X[j] <- X[j] + x[i,j]
        } 
      }
      
      X 
      
    }
      
      
    }
    
    
    print(X)
      
}
    
    
    
x    

applyy(x,1,"mean")
applyy(x,2,"mean")
applyy(x,1,"sum")
applyy(x,2,"sum")  


qq <- function(x=me){

  print(x)
}
qq(m)
qq(2)


"me"
as.character(2)
as.numeric(5)
str(1)
?str

# 13p 잘봐 !!

# Ax = lambda x 
# lambda : eigen value  , x : eigen vector

?array

w <- array(1:12 , dim=c(2,3,2), dimnames = list(c("A","B"),c("X","Y","Z"),c("N","M")) ) # 3차원 배열이 된다 (x,y,z)

w[2,3,1]
w[,"Y",]
w[1,,]
w[,,"M"]
w[1:2,,"M"]

# HW 5-3
# array(1:12, ~~~~ ) : 1 2 3    7 8 9 
#                      4 5 6   10 11 12  이렇게 바꿔 !!

apply(w,2,sum)
apply(w,1,sum)
apply(w,3,sum)
apply(w,c(1,3),sum)
# 20p 참조 1 : row sum , 3: matrix sum

aray <- function(x,d){
  X <- array(x,dim=d) # d = c(m,n,l)
  m = dim(X)[1] ; n = dim(X)[2] ; l = dim(X)[3]
  xx = array(x,dim=c(n,m,l))
  for(k in 1:l){
    X[,,k] <- t(xx[,,k])
  }
  print(X)
}

aray(1:12,c(2,3,2))
array(1:12,c(2,3,2))

# HW 5-4
# apply(,t,sum) t = 1, 2, 3 function
w[ , , ]

ap<- function(x,t){
  m = dim(x)[1] ; n = dim(x)[2] ; o = dim(x)[3]
  l = c()
  
  if(t == 1){
  
    for(i in 1:m){
    l[i]<- sum(x[i,,])
    
  }
  }
  
  if(t == 2){
    
    for(i in 1:n){
    l[i]<- sum(x[,i,])
      
    }
    
  }
  
  
  if(t == 3){
    
    for(i in 1:o){
      l[i]<- sum(x[,,i])
      
    }
    
  }
  
  l
}

ap(w,1)
ap(w,2)
ap(w,3)
w
x
apply(w,1,sum)
apply(w,2,sum)
apply(w,3,sum)

sum(x[1,])
sum(x[2,])
sum(x[3,])




