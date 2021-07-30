#5.27 Data
#file Ch05Linear model 10p

str(OrchardSprays)
OrchardSprays
#566p 비교
summary(av2 <- aov(decrease ~ factor(rowpos) + factor(colpos) + treatment, OrchardSprays))

#566p Table13.12 Anova Table 만들어봐.
y<-cbind(c(3,1,4.5,5.5),c(4.2,5.6,3.5,0.8),c(0.9,3.8,5.7,3.9),c(5.3,4.3,1.2,3.7))

y=c(3,1,4.5,5.5,4.2,5.6,3.5,.8,.9,3.8,5.7,3.9,5.3,4.3,1.2,3.7)
col=rep(c(1:4),each=4)
row=rep(c(1:4),4)
trt=c(1,3,2,4,2,4,1,3,3,1,4,2,4,2,3,1)
summary(av3<-aov(y~factor(col)+factor(row)+factor(trt)))

#535p 13.5.1 CRBD (542p)
y=c(9.1,13.4,15.6,11,12.7,17.1,20.3,24.6,18.2,19.8,20.8,28.3,23.7,21.4,25.1,11.8,16,16.2,14.1,15.8)
blo=rep(c(1:5),4)
trt=rep(c(1:4),each=5)
summary(av1<-aov(y~factor(blo)+factor(trt)))

model.tables(av1,type="means")$tables$'factor(trt)'



xtabs(~ wool + tension, warpbreaks)
summary(av3 <- aov(breaks ~ wool * tension, warpbreaks))



#535p 타이어 마모도 ABCD y1.bar y2.bar .....(12.36, 20, 23.86, 14.78, 17.75) 해봐


xtabs(~ wool + tension, warpbreaks)
str(warpbreaks)
warpbreaks
summary(av3 <- aov(breaks ~ wool * tension, warpbreaks))

#577p Anova Table - 584p 만들어봐. gl : generating level.
y=c(40,36,43,36,34,29,39,36,33,32,26,25,32,34,29,26,23,24,33,27,25,20,22,18)
a=gl(4,6)
b=gl(2,3,24)
k=gl(8,3,24)
summary(av4<-aov(y~a*b))
?gl
