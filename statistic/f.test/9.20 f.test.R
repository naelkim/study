# 9.20

# x11 , ... x1n1 ~ N(m1,sigma1 ^2)
# x21 , ... x2n2 ~ N(m2,sigma2 ^2)
x1<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)
x2<-c(2.39,2.56,2.36,2.62,2.51,2.29,2.58,2.41,2.86,2.49,2.33,1.94,2.14)

var(x1);var(x2)

fstar = var(x1)/var(x2)
alpha = 0.05
(ql = qf(alpha / 2 , length(x1) - 1 , length(x2) - 1 ))
(qr = qf(alpha / 2 , length(x1) - 1 , length(x2) - 1 ,lower.tail=F))
qf(alpha,12,12,lower.tail=F)
pf(fstar,12,12)*2

# if for 13p

x<-seq(0,2,len=6)
ifelse(x <= 1, "small" , "big")

#


ifelse(fstar > ql && fstar < qr,"accept H0" , "reject H0")

ftest <- function(x1,x2,alpha){
  n1 = length(x1) ; n2 = length(x2)
  fstar = var(x1)/var(x2)
  ql = qf(alpha / 2 , n1 - 1 , n2 - 1 )
  qr = qf(alpha / 2 , n1 - 1 , n2 - 1 ,lower.tail=F)
  
  ifelse(fstar > ql && fstar < qr,
         result <-"accept H0" , 
         result <-"reject H0")
  cat(result)
  
}

ftest(x1,x2,0.05)

?var.test 
# ratio = l (sigma1 ^2 / sigma2 ^2)
# alternative = c("two.sided",..)
var.test(x1,x2,ratio=1,alternative=c("two.sided"))
var.test(x1,x2,ratio=1,alternative=c("two.sided"))$statistic
var.test(x1,x2,ratio=1,alternative=c("two.sided"))$p.value
var.test(x1,x2,ratio=1,alternative=c("two.sided"))$conf.int


# p.value . 0.5 중앙 보다 크면 *2 작아도 *2

qf(0.5,12,12)

ifelse(fstar > qf(0.5,12,12), 2*pf(fstar,12,12,lower.tail=F) ,2*pf(fstar,12,12)) # 실패 !

n1 = length(x1) ; n2 = length(x2)
fhalf = qf(0.5,n1-1,n2-1)
ifelse(fhalf<fstar,
       pf(fstar,n1-1,n2-1,lower.tail=F)*2,
       pf(fstar,n1-1,n2-1)*2
       ) # 띵진


CI <- function(x1,x2,alpha){
  n1= length(x1) ; n2 = length(x2)
  
  cat("upper bound is ",var(x1)/(var(x2)*qf(alpha/2,n1-1,n2-1) ),"\n","lower bound is ",var(x1)/(var(x2)*qf(alpha/2,n1-1,n2-1,lower.tail=F) ))
}

CI(x1,x2,0.05) # CI

var.test(x1,x2,ratio=1,alternative=c("two.sided"),conf.level=0.95)$conf.int # CI















