# 9.30

# y =NULL : 이 경우는 두 그룹간의 비교가 아닌 한 그룹의 테스트 ex) 그룹 평균=70 테스트 263p
# 267p ex 8.2.2 : 한 그룹 테스트 : y를 입력하지 않으면 되!

# 349p 비교 : 두 그룹 간 비교


x1<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)
x2<-c(2.39,2.56,2.36,2.62,2.51,2.29,2.58,2.41,2.86,2.49,2.33,1.94,2.14)
var.test(x1,x2)$p.value

vartest <- function(x1,x2,alpha1,alpha2,l,mu,sided){
  fpvalue = var.test(x1,x2,l,alternative=c("sided"),conf.level=(1-alpha1))$p.value
  
  if(fpvalue<alpha1){
    result = t.test(x1,x2,var.equal=FALSE)
  }
  if(fpvalue>alpha1){
    result = t.test(x1,x2,var.equal=TRUE)
  }
  
  print(result)
}

vartest(x1,x2,0.05,0.05,1,0,"two.sided")

# HW 4-1

f.t.test <- function(x,y,alpha1,alpha2,sided){
  fpvalue = var.test(x,y)$p.value
  
  if(fpvalue>alpha1){
    if(sided == "two.sided"){
      tpvalue = t.test(x,y,var.equal=T,alternative="two.sided")$p.value
    }
  
    if(sided == "less"){
      tpvalue = t.test(x,y,var.equal=T,alternative="less")$p.value
    }
    if(sided == "greater"){
      tpvalue = t.test(x,y,var.equal=T,alternative="greater")$p.value
    }
    
    
  }
  else{
    if(sided == "two.sided"){
      tpvalue = t.test(x,y,var.equal=F,alternative="two.sided")$p.value
    }
    if(sided == "less"){
      tpvalue = t.test(x,y,var.equal=F,alternative="less")$p.value
    }
    if(sided == "greater"){
      tpvalue = t.test(x,y,var.equal=F,alternative="greater")$p.value
    }
    
  }
  
  
  ifelse(tpvalue<alpha2,result <- "reject H0",result <- "accept H0")
  
  result
}

f.t.test(x1,x2,0.05,0.01,"two.sided") # u1 is not equal to u2
f.t.test(x1,x2,0.05,0.01,"greater")   # u1 is not greater than u2
f.t.test(x1,x2,0.05,0.01,"less")      # u1 is not less than u2


a = "two.sided"
var.test(x1,x2,alternative=c(a))

