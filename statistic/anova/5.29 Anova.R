#5.29 Data
#file ch05linear regression
OrchardSprays
summary(av2 <- aov(decrease ~ factor(rowpos) + factor(colpos) + treatment, OrchardSprays))
str(warpbreaks)
xtabs(~ wool + tension, warpbreaks)
summary(av3 <- aov(breaks ~ wool * tension, warpbreaks))
summary(av3a <- aov(1/breaks ~ wool * tension, warpbreaks))
summary(av3b <- aov(1/breaks ~ tension + wool, warpbreaks))
summary(av3c <- aov(1/breaks ~ tension, warpbreaks))
str(warpbreaks <- within(warpbreaks, tension <- ordered(tension)))
warpbreaks #Data는 안바뀌지만, order로 기억은 한다.
summary(av3d <- aov(1/breaks ~ tension, warpbreaks))
coef(summary.lm(av3d))

#577p data 584p Anova 해봐임마!
