#6.5 Data
#5.31 logistic reg
leuk <- read.table("http://statacumen.com/teach/ADA2/ADA2_notes_Ch11_leuk.dat" , header = TRUE) 
leuk$ag <- factor(leuk$ag) #factor·Î ¹Ù²Þ
leuk$lwbc <- log(leuk$wbc) 
leuk$p.hat <- leuk$nres / leuk$ntotal # ¼º°øÈ½¼ö/ÃÑÈ½¼ö
str(leuk)

leuk #Original¿¡¼­ À§¿¡ Ãß°¡ÇØÁà¼­ ¹Ù²ñ.

glm.i.l <- glm(cbind(nres, ntotal - nres) ~ ag + lwbc, family = binomial, leuk)

dev.p.val <- 1 - pchisq(glm.i.l$deviance, glm.i.l$df.residual) 
dev.p.val

library(aod) 
coef(glm.i.l)

#wald.test(b = coef(glm.i.l), Sigma = vcov(glm.i.l), Terms = 2:3)

