#5.24 Data
#Ch05 8p
summary(av1 <- aov(sqrt(count) ~ spray, InsectSprays))
#pval 무지 작아. 분산의 차이가 있다.
model.tables(av1)
?model.tables

#13.1.2 
y<-c(1.51,1.92,1.08,2.04,2.14,1.76,1.17,1.69,0.64,0.9,1.41,1.01,0.84,1.28,1.59,1.56,1.22,1.32,1.39,1.33,1.54,1.04,2.25,1.49,1.3,0.75,1.26,0.69,0.62,0.9,1.2,0.32,0.73,0.8,0.9,1.24,0.82,0.72,0.57,1.18,0.54,1.3)

x<-c(rep(1:5,c(7,8,9,8,10)))
anova(lm(y~factor(x))) #521p
aov(y~factor(x))
?TukeyHSD
TukeyHSD(aov(y~factor(x)))
#padj=pvalue 0에 가까울 수록 확실한것. yi. 작은 순서대로 해석 (4,5,2,3,1)
#4와5는 붙어있다. 4와2는 0.468 같아,  0.05보다 작으면 떨어져있는것
#5와3은 0.07 떨어져있다. 

#pairwise.t.test = Bonfferoni.
?pairwise.t.test

pairwise.t.test(y,factor(x)) #여긴 y,x 집어넣어
#1col : 4,5가 1과 떨어져있다. (<0.05)


#543p ex13.5.3
y<-c(9.1,13.4,15.6,11,12.7,17.1,20.3,24.6,18.2,19.8,20.8,28.3,23.7,21.4,25.1,11.8,16,16.2,14.1,15.8)
x<-rep(1:4,c(rep(5,4))) # x<-rep(1:4,each=5)
length(y)
anova(lm(y~factor(x)))
aov(lm(y~factor(x)))

pairwise.t.test(y,factor(x)) #holm 방법
pairwise.t.test(y,factor(x),p.adjust.method = "bonferroni") #sd가 같은 일반적인 경우
pairwise.t.test(y,factor(x),p.adjust.method = "bonferroni",alternative="two.sided")
pairwise.t.test(y,factor(x),p.adjust.method = "bonferroni",paired=TRUE)
pairwise.t.test(y,factor(x),p.adjust.method = "bonferroni",pool.sd=FALSE) #sd가 다를때

#책과는 다르게 Cp=2.8로 계산되지 않은 것 같아...

#1과 4는 가깝다. 