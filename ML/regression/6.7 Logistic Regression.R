#Data 6.7
#file 5.31 logisticreg 10p~

leuk <- read.table("http://statacumen.com/teach/ADA2/ADA2_notes_Ch11_leuk.dat" , header = TRUE) 
leuk$ag <- factor(leuk$ag) #factor로 바꿈
leuk$lwbc <- log(leuk$wbc) 
leuk$p.hat <- leuk$nres / leuk$ntotal # 성공횟수/총횟수
str(leuk)

leuk #Original에서 위에 추가해줘서 바뀜.

glm.i.l <- glm(cbind(nres, ntotal - nres) ~ ag + lwbc, family = binomial, leuk)

dev.p.val <- 1 - pchisq(glm.i.l$deviance, glm.i.l$df.residual) 
dev.p.val

library(aod) 
coef(glm.i.l)
?glm
#3.29 glmaovlm
#우리가 했던건 gaussian 이다.
glm.i.l <- glm(cbind(nres, ntotal - nres) ~ ag + lwbc, family = binomial, leuk)
#glm은 대체로 chi test 인데, n이 너무작으면 잘 안맞아.
coef(glm.i.l)
wald.test(b = coef(glm.i.l), Sigma = vcov(glm.i.l), Terms = 2:3) #cov mat = 3by3
#vcov = x'x inverse
# terms = 2:3 beta1,2테스트
summary(glm.i.l)

leuk$fitted.values <- glm.i.l$fitted.values 
pred <- predict(glm.i.l, data.frame(lwbc = leuk$lwbc, ag = leuk$ag), type = "link" , se.fit = TRUE) 
leuk$fit <- pred$fit 
leuk$se.fit <- pred$se.fit # CI for fitted values 
leuk <- within(leuk, { fit.lower = exp(fit - 1.96 * se.fit) / (1 + exp(fit - 1.96 * se.fit)) 
fit.upper = exp(fit + 1.96 * se.fit) / (1 + exp(fit + 1.96 * se.fit)) }) #round(leuk, 3)

library(ggplot2) 
p <- ggplot(leuk, aes(x = lwbc, y = p.hat, colour = ag, fill = ag)) 
# predicted curve and point-wise 95% CI 
p <- p + geom_ribbon(aes(x = lwbc, ymin = fit.lower, ymax = fit.upper), alpha = 0.2) 
p <- p + geom_line(aes(x = lwbc, y = fitted.values)) # fitted values 
p <- p + geom_point(aes(y = fitted.values), size=2) 
# observed values 
p <- p + geom_point(size = 2, alpha = 0.5) 
p <- p + labs(title = "Observed and predicted probability of 1+ year survival") 
print(p)


beetles <- read.table("http://statacumen.com/teach/ADA2/ADA2_notes_Ch11_beetles.dat", header=TRUE )
beetles$rep <- factor(beetles$rep) 
beetles$conc2 <- beetles$conc^2 # for quadratic term (making coding a little easier) 
beetles$p.hat <- beetles$y / beetles$n # observed proportion of successes 

beetles$emp.logit <- log(( beetles$p.hat + 0.5/beetles$n) / (1 - beetles$p.hat + 0.5/beetles$n)) 

library(ggplot2) 
p <- ggplot(beetles, aes(x = conc, y = p.hat, shape = rep)) 
# observed values 
p <- p + geom_point(color = "black", size = 3, alpha = 0.5) 
p <- p + labs(title = "Observed mortality, probability scale") 
print(p)

library(ggplot2)
p <- ggplot(beetles, aes(x = conc, y = emp.logit)) 
p <- p + geom_smooth(method = "lm", colour = "red", se = FALSE)
p <- p + geom_smooth(method = "lm", formula = y ~ poly(x, 2), colour = "blue", se = FALSE) 
# observed values 
p <- p + geom_point(aes(shape = rep), color = "black", size = 3, alpha = 0.5) 
p <- p + labs(title = "Empirical logit with `naive' LS fits (not MLE)") 
print(p)

#31p

trauma <- read.table("http://statacumen.com/teach/ADA2/ADA2_notes_Ch11_trauma.dat" , header = TRUE)
trauma <- within(trauma, { as = a3 + a4 + a5 + a6 # as = head 
bs = b3 + b4 + b5 + b6 # bs = face 
cs = c3 + c4 + c5 + c6 # cs = neck 
ds = d3 + d4 + d5 + d6 # ds = thorax 
es = e3 + e4 + e5 + e6 # es = abdomen 
fs = f3 + f4 + f5 + f6 # fs = spine 
gs = g3 + g4 + g5 + g6 # gs = upper extremities 
hs = h3 + h4 + h5 + h6 # hs = lower extremities 
js = j3 + j4 + j5 + j6 # js = skin 
}) 
trauma <- subset(trauma, select = c(id, surv, as:js, iss:prob)) 
head(trauma)

library(reshape2) 
trauma.long <- melt(trauma, id.vars = c("id", "surv", "prob"))


#~ 해봐!!


