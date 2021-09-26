# 9.27

# 361p data
x1<-c(1.79,1.87,1.62,1.96,1.75,1.74,2.06,1.69,1.67,1.94,1.33,1.7,1.65)
x2<-c(2.39,2.56,2.36,2.62,2.51,2.29,2.58,2.41,2.86,2.49,2.33,1.94,2.14)

# 350~351p

 # 두 그룹간의 비교 mu = l , var.equal = T : var가 같다.
# H0 : M1 - M2 = l
# Ha : not H0

t.test(x1,x2,var.equal=T) # two.sided
# var 가 같을 때 !! , var 가 다를땐 df 가 특이하게나옴ㅋ
cat("alternative hypothesis: true difference in means is not equal to 0")

ttest<-function(x,y){
  cat("alternative hypothesis: true difference in means is not equal to 0")
  
}
ttest(x1,x2)


t.test(x1,x2,"less",var.equal=TRUE) # Ha: M1-M2 < l 순서만 맞추어 주면 생략 가능!! , paired , var.equal순서


# less than

T.test <- function(x,y,mu,sided,alpha){
  mx = mean(x) ; my = mean(y) ; n1 =length(x) ; n2 = length(y) # tstar, df 는 test마다 변하지 않으므로 if 밖에 지정
  vx = var(x) ; vy = var(y)
  Sp2 =( (n1-1) * vx + (n2-1) * vy ) / (n1 + n2 - 2)
  tstar =( (mx - my) - mu ) / (sqrt(Sp2*(1/n1 + 1/n2))) # 346p
  df = n1 + n2 - 2 
  
  if(sided == "two.sided"){
    ifelse(tstar>0,pvalue<-pt(tstar,df,lower.tail=F)*2,pvalue<-pt(tstar,df)*2)
    result = c("alternative hypothesis: true difference in means is not equal to ",mu)
    L1 = (mx-my)-qt(alpha/2,df,lower.tail=F)*sqrt(Sp2*((1/n1)+(1/n2)))  ; L2 = (mx-my)+qt(alpha/2,df,lower.tail=F)*sqrt(Sp2*((1/n1)+(1/n2)))
  }
  if(sided == "less"){
    pvalue <- pt(tstar,df)
    result = c("alternative hypothesis : true difference in means is less than",mu)
    L1 = "-Inf"
    L2 = (mx-my ) -qt(alpha,df)*sqrt(Sp2*((1/n1) + (1/n2)) )  
  }
  if(sided == "greater"){
    pvalue <- pt(tstar,df,lower.tail=F)
    result = c("alternative hypothesis : true difference in means is greater than",mu)
    L1 = (mx-my ) +qt(alpha,df)*sqrt(Sp2*((1/n1) + (1/n2)) )
    L2 = "Inf"
  }
  cat("	Two Sample t-test\n\ndata: x and y\nt =",round(tstar,4),", df = ",df,", p-value = ",pvalue, "\n",result,"\n",(1-alpha)*100," percent confidence interval:\n",L1,L2,"\nsample estimates:\nmean of x mean of y\n",mx,my,sep=" ")
  
}

T.test(x1,x2,0,"less",0.05)
t.test(x1,x2,"less",var.equal=T)

T.test(x1,x2,0,"greater",0.05)
t.test(x1,x2,"greater",var.equal=T)

T.test(x1,x2,0,"two.sided",0.05)
t.test(x1,x2,"two.sided",var.equal=T)

round(0.33333666,4)


