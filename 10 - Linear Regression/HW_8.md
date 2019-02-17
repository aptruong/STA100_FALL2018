---
title: "HW#8 (fitness)"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
---



# Online you will find the file Fitness.csv, which containsthe following columns:
Column 1:Tread:  The typical amount of time training at high intensity on the treadmill (X).  
Column 2:Run:  The time it took to complete a 10 kilo-meter run (in minutes) (Y).   
It is suspected that the amount of high-intensity trainingmay effect the time it took to complete a 10 kilometer run.  

## read data

```r
library("MASS")
Fitness <- read.csv("C:/Users/Apple/Downloads/R Files/Fitness.csv")
head(Fitness)
```

```
##   Tread  Run
## 1   7.5 43.5
## 2   7.8 45.2
## 3   7.9 44.9
## 4   8.1 41.1
## 5   8.3 43.8
## 6   8.7 44.4
```

```r
names(Fitness)
```

```
## [1] "Tread" "Run"
```

##(Ia) estimated intercept of the regression line

```r
plot(Fitness$Tread,Fitness$Run,xlab = "Tread", ylab = "Run (mins)",main = "Relationship Between Tread and Run")
lin.model = lm(Run ~ Tread, data = Fitness)
the.betas = lin.model$coefficients
s.e = summary(lin.model)$sigma
r.2 =summary(lin.model)$r.squared 
abline(the.betas)
```

![](HW_8_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
the.betas[1]
```

```
## (Intercept) 
##    59.92112
```
>59.92112 

##(Ib) estimated slope of the regression line

```r
the.betas[2]
```

```
##     Tread 
## -1.960135
```
>-1.960135 

##(Ic) lower bound for the 95% CI for the slope

```r
confint(lin.model,level = 0.95)
```

```
##                 2.5 %    97.5 %
## (Intercept) 53.373295 66.468942
## Tread       -2.624957 -1.295313
```
>look at tread, it's slope
>-2.624957

##(Id) upper bound for the 95% CI for the slope
>-1.295313

##(Ie) find value of se

```r
s.e
```

```
## [1] 1.920929
```
>1.920929

##(If) find value of r^2

```r
r.2
```

```
## [1] 0.6806758
```
>0.6806758

##(Ig) does assumption of normality of the error terms appear to hold?

```r
ei = lin.model$residuals
qqnorm(ei)
qqline(ei)
```

![](HW_8_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
shapiro.test(ei)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ei
## W = 0.96165, p-value = 0.5773
```

##(Ih) does interval suggest a sig lin rel?