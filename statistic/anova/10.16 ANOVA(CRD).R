# 10.16

f <- function(x) print(x^2)
f(5)
do.call(f,list(5)) # 함수 불러오기

f <- function(x,y) print(x^2+y)
f(1,5)
do.call(f,list(1,5))

?methods
methods(summary)

?apropos
apropos("glm") # 관련 명령어 전부

find("cor") # 어떤 패키지에 있는가.


# ANOVA(CRD) p.514

y = list()
y[[1]] <- c(1.51, 1.92, 1.08, 2.04, 2.14, 1.76, 1.17)
y[[2]] <- c(1.69, 0.64, 0.9, 1.41, 1.01, 0.84, 1.28, 1.59)
y[[3]] <- c(1.56, 1.22, 1.32, 1.39, 1.33, 1.54, 1.04, 2.25, 1.49)
y[[4]] <- c(1.3, 0.75, 1.26, 0.69, 0.62, 0.9, 1.2, 0.32)
y[[5]] <- c(0.73, 0.8, 0.9, 1.24, 0.82, 0.72, 0.57, 1.18, 0.54, 1.3)
y

anovaa = function(y){
  k = length(y)
  n <- c() ; t =c()
  
  for(i in 1:k){
    n[i] <- length(y[[i]])
    t[i] = sum(y[[i]])
  }
  n
  
  N = sum(n)
  t.. = sum(t)
  
  tn = c()
  for(i in 1:k){
    tn[i] = (t[i]^2 / n[i])
  }
  SStrt = sum(tn) - t..^2 / N
  
  
  yij2 = 0
  for(i in 1:k){
    yij2 <-yij2 + sum(y[[i]]^2)
  }
  
  SStot = yij2 - t..^2/N
  SSE   = SStot - SStrt
  
  MStrt  = SStrt / (k-1)
  MSE    = SSE   / (N-k)
  
  fstar = MStrt / MSE
  p.value = pf(fstar,k-1,N-k,lower.tail=F)
  
  z <- list('SStrt' = (SStrt) , 'SSE' =(SSE), 'SStot'=(SStot),'MStrt' = (MStrt),'MSE'=(MSE),'fstar'=(fstar),'p.value'=(p.value))
  return(z)
}

anovaa(y)

#CRD
#p.514

x <-c(rep(1,7),rep(2,8),rep(3,9),rep(4,8),rep(5,10))
y<-c(1.51, 1.92, 1.08, 2.04, 2.14, 1.76, 1.17,
     1.69, 0.64, 0.9, 1.41, 1.01,0.84, 1.28, 1.59, 
     1.56, 1.22, 1.32, 1.39, 1.33, 1.54, 1.04, 2.25, 1.49, 
     1.30, 0.75, 1.26, 0.69, 0.62, 0.90, 1.20, 0.32, 
     0.73, 0.80, 0.90, 1.24, 0.82, 0.72, 0.57, 1.18, 0.54, 1.30)
names(aov(y~factor(x)))
#coefficients    residuals   effects  qr    fitted.values     assign   call 
#rank = 5    df.residual=37   contrasts=contr.treatment     xlevels=factor(x)
#        terms     model
summary(aov(y~factor(x)))
aov(y~factor(x))



