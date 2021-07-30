# 10.21

# factor : Data structure 1 - 34p

?factor

factor(rep(1:2,4),labels = c("trt.1","trt.2"))
factor(rep(1:3, 4), labels=c("low", "med", "high"), ordered=TRUE) 
f <- gl(3,2,labels = paste("trt",1:3,sep="."))


# 566p TABLE : 13.12 

x = matrix(c(3,1,4.5,5.5,4.2,5.6,3.5,0.8,0.9,3.8,5.7,3.9,5.3,4.3,1.2,3.7),4)
trt = c(1,3,2,4,2,4,1,3,3,1,4,2,4,2,3,1)
trt = factor(trt)

tapply(x,trt,mean) # 그룹 별 연산 : Y1.. Y2.. Y3.. Y4..

col = gl(4,4) # column은 gl써서 해봐
row = factor(rep(1:4,4))

tapply(x,row,sum) # t.1. t.2. t.3. t.4.
tapply(x,col,sum) # t..1 t..2 t..3 t..4

## 이것들을 참고로 Latin Squre 를 구현 !!

Latin.Square<- function(x,trt){
  n = length(x) ; r = nrow(x)
  col = gl(r,r) ; row = factor(rep(1:r,r))
  trt = factor(trt)
  
  ti.. = tapply(x,trt,sum)
  t.i. = tapply(x,row,sum)
  t..i = tapply(x,col,sum)
  t... = sum(x)
  
  SStrt = sum(ti..^2)/r - t...^2/r^2
  SSrow = sum(t.i.^2)/r - t...^2/r^2
  SScol = sum(t..i^2)/r - t...^2/r^2
  SStot = sum(x^2) - t...^2/r^2
  SSErr = SStot - (SStrt + SSrow + SScol)
  
  MStrt = SStrt / (r-1) 
  MSrow = SSrow / (r-1)
  MScol = SScol / (r-1)
  MSErr = SSErr / ( (r-1)*(r-2) )
  
  Ftrt = MStrt/MSErr
  Frow = MSrow/MSErr
  Fcol = MScol/MSErr
  
  p.val.trt = pf(Ftrt,(r-1),(r-1)*(r-2),lower.tail=F)
  p.val.row = pf(Frow,(r-1),(r-1)*(r-2),lower.tail=F)
  p.val.col = pf(Fcol,(r-1),(r-1)*(r-2),lower.tail=F)
  
  z <- list('p.trt' = (p.val.trt),'p.row'=(p.val.row),'p.col'=(p.val.col))
  return(z)
}

Latin.Square(x,trt)

# by 명령어 
t <- factor(c(1,3,2,4,2,4,1,3,3,1,4,2,4,2,3,1)) # 알파벳
r <- gl(4,1,16) # row
c <- gl(4,4)    # col
y <- c(3,1,4.5,5.5,
       4.2,5.6,3.5,.8,
       .9,3.8,5.7,3.9,
       5.3,4.3,1.2,3.7)
summary(aov(y ~t+r+c))



