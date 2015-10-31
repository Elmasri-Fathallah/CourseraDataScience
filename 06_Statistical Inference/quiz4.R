#q2
#pair t
d = s1 - s2
mean(d)/(sd(d)/sqrt(5))
2*(1-pt(2.261646, 4))

#q4
#pair t
s1 <- c(1,1,1,0)
s2 <- c(0,0,0,1)
d = s1 - s2
mean(d)/(sd(d)/sqrt(4))
1-pt(1, 4)

#q8
power.t.test(n=100, delta = 0.01,sd=0.04, type = "one.sample",
             alternative = "one.sided")

#q9
power.t.test(power=0.9, delta = 0.01,sd=0.04, type = "one.sample",
             alternative = "one.sided")

#q10
power.t.test(n=100, delta = 0.01,sd=0.04, type = "one.sample",
             sig.level = 0.05, alternative = "one.sided")
power.t.test(n=100, delta = 0.01,sd=0.04, type = "one.sample",
             sig.level = 0.1, alternative = "one.sided")
