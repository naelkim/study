# 10.18

# RCBD p.535

x = matrix(c(9.1,13.4,15.6,11,12.7,17.1,20.3,24.6,18.2,19.8,20.8,28.3,23.7,21.4,25.1,11.8,16,16.2,14.1,15.8),5)
b = rep(1:5,4)       # blocks
t = rep(1:4,each=5)  # treatment

# SST

x
( sum(x[,1])^2 +sum(x[,2])^2 + sum(x[,3])^2 + sum(x[,4])^2 ) / 5 - sum(x)^2/(5*4)


# by f.t

RCBD = function(x,alpha1,alpha2){
  b = nrow(x) ; k = ncol(x)
  
  Ti. = apply(x,2,sum) ; T.. = sum(x)
  sstrt = sum(Ti.^2/b) - T..^2/(k*b)
  
  T.i = apply(x,1,sum)
  ssblk = sum(T.i^2/k) - T..^2/(k*b)
  
  sst = sum(x^2) - T..^2/(k*b)
  
  sse = sst - sstrt - ssblk
  
  mstrt = sstrt / (k-1)
  msblk = ssblk / (b-1)
  mse = sse / ( (k-1)*(b-1) )
  
  p.val1 = pf(mstrt/mse,k-1,(k-1)*(b-1),lower.tail=F)
  p.val2 = pf(msblk/mse,b-1,(k-1)*(b-1),lower.tail=F)
  
  ifelse(p.val1 < alpha1,result1 <- "reject H0",result1 <- "accept H0")
  ifelse(p.val2 < alpha2,result2 <- "reject H0",result2 <- "accept H0")
  
  cat("first : ",result1,"\n second : ",result2)
  
  
}

RCBD(x,0.05,0.05)

# z<-list('sstrt'=(sstrt),'ssblk'=(ssblk),'sse'=(sse),'sst'=(sst),'mstrt'=(mstrt),'msblk'=(msblk),'mse'=(mse),'p.val1'=(p.val1),'p.val2'=(p.val2))  return(z)

RCBD. = function(x,overallalpha,c){
  b = nrow(x) ; k = ncol(x)
  
  Ti. = apply(x,2,sum) ; T.. = sum(x)
  sstrt = sum(Ti.^2/b) - T..^2/(k*b)
  
  T.i = apply(x,1,sum)
  ssblk = sum(T.i^2/k) - T..^2/(k*b)
  
  sst = sum(x^2) - T..^2/(k*b)
  
  sse = sst - sstrt - ssblk
  
  mstrt = sstrt / (k-1)
  msblk = ssblk / (b-1)
  mse = sse / ( (k-1)*(b-1) )
  
  p.val1 = pf(mstrt/mse,k-1,(k-1)*(b-1),lower.tail=F)
  p.val2 = pf(msblk/mse,b-1,(k-1)*(b-1),lower.tail=F)
  
  ifelse(p.val1 < overallalpha/c,result1 <- "reject H0",result1 <- "accept H0")
  ifelse(p.val2 < overallalpha/c,result2 <- "reject H0",result2 <- "accept H0")
  
  cat("first : ",result1,"\n second : ",result2)
  
  
}

RCBD.(x,0.000000005,2)

# by ¸í·É¾î
y <- c(9.1,13.4,15.6,11.0,12.7,
       17.1,20.3,24.6,18.2,19.8,
       20.8,28.3,23.7,21.4,25.1,
       11.8,16.0,16.2,14.1,15.8)
t <- gl(4,5)
b <- gl(5,1,20)
summary(aov(y~t+b))

