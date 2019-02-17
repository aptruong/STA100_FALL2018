---
title: "HW#5 (drp &iq)"
author: "April Truong"
date: "due Nov 9, 2018"
output: 
  html_document: 
    keep_md: yes
---



# Read data

```r
DRP <- readr::read_csv("C:/Users/Apple/Downloads/R Files/DRP.csv")
```

```
## Parsed with column specification:
## cols(
##   Treatment = col_character(),
##   Response = col_double()
## )
```

#I. You  will  be  using  the  datasetDRP.csv(orDRP.txt).Results of an experiment to test whether directed read-ing  activities  in  the  classroom  help  elementary  schoolstudents  improve  aspects  of  their  reading  ability. A treatment class of 21 third-grade students participated in these activities for eight weeks, and a control class of 23 third-graders followed the same curriculum without the activities. After the eight-week period, students in both classes took a Degree of Reading Power (DRP) test which measures the aspects of reading ability that the treatment is designed to improve. The first column is the group (treatment or control), and the second is the DRP score (the higher the better).

##(Ia) lower bound for the 95% CI for the diff. in avg DRP score

```r
the.stuff = t.test(Response~Treatment, data = DRP, conf.level = 0.95)
the.stuff$conf.int[1]
```

```
## [1] -18.67588
```
>-18.67588

##(Ib) upper bound for the 95% CI for the diff. in avg DRP score

```r
the.stuff$conf.int[2]
```

```
## [1] -1.23302
```
>-1.23302

##(Ic) ts

```r
control = c(42,43,55,26,62,37,33,41,19,54,20,85,46,10,17,60,53,42,37,42,55,28,48)
treated = c(24,43,58,71,43,49,61,44,67,49,53,56,59,52,62,54,57,33,46,43,57)
treat = data.frame(score = c(control,treated),group = rep(c("control","treated"),times = c(length(control),length(treated))) )
two.side = t.test(score ~ group, data = treat, conf.level = 0.95,alternative = "two.sided")
less = t.test(score ~ group, data = treat, conf.level = 0.95,alternative = "less")
two.side$statistic
```

```
##         t 
## -2.310889
```
>-2.310889 

##(Id) p-val

```r
two.side = t.test(Response ~ Treatment, data = DRP, conf.level = 0.95,alternative = "two.sided")
less = t.test(score ~ group, data = treat, conf.level = 0.95,alternative = "less")
less$statistic
```

```
##         t 
## -2.310889
```

```r
less$p.value
```

```
## [1] 0.01319121
```

```r
round(less$p.value, digits = 4)
```

```
## [1] 0.0132
```
>0.0132

##(Ie) alpha = 0.05; reject OR fail to reject
>P-val 0.0264 < alpha 0.05 --> reject


#II. On Canvas under Files you will find a dataset IQ.csv.It has two columns, the first of which denotes what major a student is from (A, B, or C). The second is the IQ measured by the Stanford-Binet Intelligence Scales. The goal is to determine if this IQ measures differs on averagebetween majors.

##read data

```r
IQ <- readr::read_csv("C:/Users/Apple/Downloads/R Files/IQ.csv")
```

```
## Parsed with column specification:
## cols(
##   group = col_character(),
##   iq = col_double()
## )
```

##(IIa) F ts

```r
names(IQ) <- c("major", "IQ")
names(IQ)
```

```
## [1] "major" "IQ"
```

```r
the.model = lm(IQ ~ major, data = IQ)
ANOVA.table = anova(the.model)
ANOVA.table
```

```
## Analysis of Variance Table
## 
## Response: IQ
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## major      2 1529.4  764.69  20.016 7.843e-07 ***
## Residuals 42 1604.5   38.20                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
F.stat = ANOVA.table[1,4]
F.stat
```

```
## [1] 20.01637
```

```r
round(F.stat, digits = 4)
```

```
## [1] 20.0164
```
>20.0164

##(IIb) p-val

```r
p.value = ANOVA.table[1,5]
p.value
```

```
## [1] 7.843384e-07
```

```r
round(p.value, digits = 4)
```

```
## [1] 0
```
>0

##(IIc) fail to reject OR reject null
>p-val 0 < alpha --> reject

##(IId) conclusion
>We conclude that at least one average IQ for the majors is different. 

##(IIe) plot normal probability plot of IQ scores; normally distributed? 

```r
qqnorm(IQ$IQ,main = "Normal Probability Plot for IQ")
qqline(IQ$IQ)
```

![](HW_5_files/figure-html/unnamed-chunk-9-1.png)<!-- -->
>Approximately non-normal, because of large deviations from the line in the tails. 


