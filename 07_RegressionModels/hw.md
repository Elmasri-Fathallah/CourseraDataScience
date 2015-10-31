## Motor Trend: Automatic or Manual?
========================================================

Shenda Hong

In this report, we exploring the relationship between a set of variables and miles per gallon (MPG) (outcome). And we are particularly interested in the following two questions:

1. Is an automatic or manual transmission better for MPG?

2. Quantify the MPG difference between automatic and manual transmissions.

Let's first look at the dataset:


```r
data(mtcars)
str(mtcars)
```

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

We mainly focusing on the variable mpg(miles per gallon) and am(1 represents automatic transmission, 0 represents manual transmission), here is the box plot:


```r
boxplot(mpg ~ am, data = mtcars, xlab = "am", ylab = "mpg", 
        main = "mpg versus am")
```

<img src="figure/unnamed-chunk-2.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="300" />

Answer1: According to the above plot, we can easily figure out that auto transmission cars have higher mpg, means that they are better for MPG.

Now let's Quantify the MPG difference between automatic and manual transmissions. 

We First build a regression model.


```r
fit<-glm(mpg ~ as.factor(cyl) + as.factor(vs) + as.factor(am) + as.factor(gear) + 
           as.factor(carb) + disp + hp + drat + wt + qsec, data=mtcars)
summary(fit)
```

The variables are too many to analyze, now selecting the best regression mode step by step.

The most easy and effective way is use stepAIC function in MASS package.


```r
library(MASS)
stepAIC(fit, direction="backward")
```

The final regression mode is:

mpg ~ as.factor(cyl) + as.factor(am) + hp + wt

But we are not allowed to use any packages that are not in R-base or the library datasets.

So let's use correlations instead:


```r
cor(mtcars)
```

Choose variables which have higher correlations to mpg, The answer is similar.

Fit the best model, plot residual and do some diagnostics.


```r
fitbest <- glm(mpg ~ as.factor(cyl) + as.factor(am) + hp + wt, data=mtcars)
#plot(fitbest)
```


```r
summary(fitbest)$coefficients
```

```
##                 Estimate Std. Error t value  Pr(>|t|)
## (Intercept)     33.70832    2.60489 12.9404 7.733e-13
## as.factor(cyl)6 -3.03134    1.40728 -2.1540 4.068e-02
## as.factor(cyl)8 -2.16368    2.28425 -0.9472 3.523e-01
## as.factor(am)1   1.80921    1.39630  1.2957 2.065e-01
## hp              -0.03211    0.01369 -2.3450 2.693e-02
## wt              -2.49683    0.88559 -2.8194 9.081e-03
```

Answer 2: According to Coefficients of as.factor(am)1, Automatic transmission has higher mpg(1.8092 of increase adjusted by wt, hp, and cyl) compared to manual tranmission.

## Summary

Holding other variables constant, auto transmission cars have about 1.8 miles per gallon more than manual transmission, means that they are better for MPG.

## Appendix

residual plot and some diagnostics

<img src="figure/unnamed-chunk-81.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="300" /><img src="figure/unnamed-chunk-82.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="300" /><img src="figure/unnamed-chunk-83.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="300" /><img src="figure/unnamed-chunk-84.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="300" />
