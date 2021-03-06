---
title: "STA-100-R-Handout-Two-Sample-CI-And-Hypothesis-Tests"
author: "Erin K. Melcon"
output: 
  html_document: 
    keep_md: yes
---

### 1. Hypothesis Test for Independent Samples - The data

The following data is on performance on a task measuring short term memory (higher score is better) for those who smoke marijuana and those who do not (note, you will be reading in your data, so you will not have to worry about the following commands).  Notice the format of the data is the first column is the numerical values, and the second is the group.

```r
nonsmokers = c(18,22,21,17,20,17,23,20,22,21)
smokers = c(16,20,14,21,20,18,13,15,17,21)
smoke = data.frame(score = c(nonsmokers,smokers),group = rep(c("Non-Smoke","Smoke"),times = c(length(nonsmokers),length(smokers))) )
```

### 2. Hypothesis test for indepdendent sample
We actually use exactly the same function as before, and now access different things.  To run a two sided, greater than, or less than alternative hypothesis you would do the following:

```r
two.side = t.test(score ~ group, data = smoke, conf.level = 0.99,alternative = "two.sided")
greater = t.test(score ~ group, data = smoke, conf.level = 0.99,alternative = "greater")
less = t.test(score ~ group, data = smoke, conf.level = 0.99,alternative = "less")
```

Now, for each of these objects I've saved, R has also stored the test-statistic and p-value, which are stored in `two.side$statistic` and `two.side$p.value` for example.  

As an example, the p-value for the two-sided test is:

```r
two.side$p.value
```

```
## [1] 0.03797543
```
With test-statistic

```r
two.side$statistic
```

```
##        t 
## 2.257316
```

Notice you can tell which group was 1 and which group was 2 by typing (for example) `two.side$estimate` and seeing which group came first.  I.e,

```r
two.side$estimate
```

```
## mean in group Non-Smoke     mean in group Smoke 
##                    20.1                    17.5
```
shows that the group Non-Smoke was designated to group 1.

Another small note is the confidence intervals for the one-sided tests should not be used, in general.


# 1. ANOVA - The data

For this handout, I will use a built in dataset that is already in R (so you do not have to load a dataset to use this handout).  For your homework, you will read in the data as we usually do.

The dataset is called `PlantGrowth`, and you can learn about it by typing `?PlantGrowth` into R.  the names of `PlantGrowth` are:

```r
names(PlantGrowth)
```

```
## [1] "weight" "group"
```
The column `weight` is numeric, while the column `group` is a categorical value.  `weight` represents the weight in ounces of plants, and `group` has values `ctrl` (control), `trt1` (treatment 1), and `trt2` (treatment 2).

The goal is to use ANOVA to see if the group means are different, and then find which were different using Bonferroni confidence intervals.

### 2. The ANOVA table
The first step is to create our model in R.  This is done using the function lm, and can be accomplished with the following:

```r
the.model = lm(weight ~ group, data = PlantGrowth)
```
For your homework, `weight` would be the name of your column which has numeric values, and `group` would be the name of the column which has categorical values.

Now, we use the function `anova` to calculate the ANOVA table:

```r
ANOVA.table = anova(the.model)
```
We can print it out by typing the name of what we called it:


```r
ANOVA.table
```

```
## Analysis of Variance Table
## 
## Response: weight
##           Df  Sum Sq Mean Sq F value  Pr(>F)  
## group      2  3.7663  1.8832  4.8461 0.01591 *
## Residuals 27 10.4921  0.3886                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
And now we can see that we have all the values we want.  The row `group` is the `between` row (so it gives df(between), SS(between), MS(between), Fs, and P(F > Fs) in that order), and the `Residuals` row is the `within/error` row, so it gives df(within), SS(within), MS(within).  

To get a partiular value, we must ask R to save or print the values in various rows and columns of the anova table.  I typically only use the F statistic and p-value, so here is how to get those back:

```r
F.stat = ANOVA.table[1,4]
p.value = ANOVA.table[1,5]
```
For `ANOVA.table[1,4]`, this says give me the value in the first row, fourth column of the object saved in `ANOVA.table` (which is where the F-statistic is kept).  

For `ANOVA.table[1,4]`, this says give me the value in the first row, fifth column of the object saved in `ANOVA.table` (which is where p-value is kept).  

Then I can have R display them as follows:

```r
F.stat
```

```
## [1] 4.846088
```

```r
p.value
```

```
## [1] 0.01590996
```



