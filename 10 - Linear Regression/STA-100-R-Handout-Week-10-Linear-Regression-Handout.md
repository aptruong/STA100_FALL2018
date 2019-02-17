---
title: "STA-100 Linear Regression"
author: "Erin K. Melcon"
date: "March 1, 2016"
output: 
  html_document: 
    keep_md: yes
---
For this handout we will be working with the data `cats` in the library `MASS`:

```r
library("MASS")
head(cats)
```

```
##   Sex Bwt Hwt
## 1   F 2.0 7.0
## 2   F 2.0 7.4
## 3   F 2.0 9.5
## 4   F 2.1 7.2
## 5   F 2.1 7.3
## 6   F 2.1 7.6
```
Note, you will have to read in your data as usual.  Note further, we are only using the second two columns of `cats`.  

As usual, we will want to know the names of the columns:

```r
names(cats)
```

```
## [1] "Sex" "Bwt" "Hwt"
```
The column `Bwt` gives the body weight of cats in kg, and the column $Hwt$ gives the weight of the cats heart in grams (g).

# 1. Plotting the data
First step is to visualize the data, and we use the function `plot` for this.  Plot expects the columns of your dataset, and the first column you give it will be on the x-axis, and the second will be on the y-axis:

```r
plot(cats$Bwt,cats$Hwt,xlab = "Body Weight (kg)", ylab = "Heart Weight (g)",main = "Relationship Between Body and Heart Weight")
```

![](STA-100-R-Handout-Week-10-Linear-Regression-Handout_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

As we can see, there is a linear trend, and there may be outliers.

# 2. Removing outliers
Outliers are a huge problem for regression, so in many cases we want to remove outliers.  Here, I am going to use the boxplot method to find the upper and lower values for outliers, and then remove any observations that fall beyond those values.

To find the upper and lower values, I can use the function `quantile` (note I am finding outliers for both my response and explanatory variable):

```r
Q1.Y = quantile(cats$Hwt,0.25)
Q3.Y = quantile(cats$Hwt,0.75)
lower.Y = Q1.Y - 1.5*(Q3.Y-Q1.Y)
upper.Y = Q3.Y + 1.5*(Q3.Y-Q1.Y)
outliers.Y = which(cats$Hwt > upper.Y | cats$Hwt < lower.Y)

Q1.X = quantile(cats$Bwt,0.25)
Q3.X = quantile(cats$Bwt,0.75)
lower.X = Q1.X - 1.5*(Q3.X-Q1.X)
upper.X = Q3.X + 1.5*(Q3.X-Q1.X)
outliers.X = which(cats$Bwt > upper.X | cats$Bwt < lower.X)

data.no.outliers = cats[-c(outliers.X,outliers.Y),] #this removes the corresponding rows with outliers
```
What you would need to change for the above code is `cats$Hwt` to `dataset$Y`, where dataset would be the name of your dataset, and Y would be the name of your Y column (the column that contains Y), and `cats$Bwt` to `dataset$X`, where dataset would be the name of your dataset, and X would be the name of the X column (the column that contains X). 

All the above has done is find the upper and lower fences, and seen if any observations in each column are outliers, then remove them.  My dataset `data.no.outliers` now has the outliers removed:


```r
plot(data.no.outliers$Bwt,data.no.outliers$Hwt,xlab = "Body Weight (kg)", ylab = "Heart Weight (g)",main = "Relationship Between Body and Heart Weight")
```

![](STA-100-R-Handout-Week-10-Linear-Regression-Handout_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

The rows that had outliers were:

```r
outliers.X #For body weight
```

```
## integer(0)
```

```r
outliers.Y #For heart weight
```

```
## [1] 135 144
```
To view these rows, we would do:


```r
cats[c(outliers.X,outliers.Y),]
```

```
##     Sex Bwt  Hwt
## 135   M 3.5 17.2
## 144   M 3.9 20.5
```

You will have to adjust the names of the columns, and the names in general, but the above code can be used to remove outliers from any dataset.

# 3. Fitting the model
We will again use the function `lm`, which stands for "linear model".  We will use it in the same way, where the function expects the name of the column of your response variable, a `~`, and the name of the column of your explanatory variable, and then the name of the data we are using.

For example, I suspect a cats heart weight depends on their body weight, so my explanatory variable is `Bwt`, and my response variable is `Hwt`.  To find the linear model and find the estimates for the slope, intercept, and value of $s_e$ and $r^2$, we may use the following code **note that I use the data without outliers**.

```r
lin.model = lm(Hwt ~ Bwt,data = data.no.outliers)
the.betas = lin.model$coefficients
s.e = summary(lin.model)$sigma
r.2 =summary(lin.model)$r.squared 
```

`the.betas` now has two things in it; the estimated intercept and the estimated slope.  To access the intercept, we may use the command

```r
the.betas[1]
```

```
## (Intercept) 
##   0.3373229
```
and to access the slope we may use

```r
the.betas[2]
```

```
##      Bwt 
## 3.755718
```

The value of $s_e$ is : 

```r
s.e
```

```
## [1] 1.358818
```
$r^2$ is

```r
r.2
```

```
## [1] 0.6334244
```

# 3.1 Plotting the regression line:
To plot the regression line, we plot the data (without outliers), and add the line to the plot:

```r
plot(data.no.outliers$Bwt,data.no.outliers$Hwt,xlab = "Body Weight (kg)", ylab = "Heart Weight (g)",main = "Relationship Between Body and Heart Weight")
abline(the.betas)
```

![](STA-100-R-Handout-Week-10-Linear-Regression-Handout_files/figure-html/unnamed-chunk-13-1.png)<!-- -->
# 4. Finding confidence intervals
Confidence intervals for the slope or intercept or both are very easy to find, and use the function `confint` on the above linear model we have fit, i.e `lin.model`.  It automatically gives both confidence intervals:

```r
confint(lin.model,level = 0.90)
```

```
##                   5 %     95 %
## (Intercept) -0.762485 1.437131
## Bwt          3.355889 4.155546
```
But if we only want the slope, we could use the following:


```r
both.CI = confint(lin.model,level = 0.95)
slope.CI = both.CI[2,]
```
If you want to change what confidence level you are using, simply change `level = 0.95` to something else.  

# 5. Checking equal variance
To check equal variance, we typically plot the fitted values against the residuals, and add a horizontal line at zero:

```r
y.hat = lin.model$fitted.values
ei = lin.model$residuals
plot(y.hat,ei)
abline(h = 0, col = "purple")
```

![](STA-100-R-Handout-Week-10-Linear-Regression-Handout_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

Here we can see the error spread about the line at zero is roughly equal as we look from left to right, so that the equality of variance of the errors appears to hold.

# 6. Normality of Errors
To check normality, now that the errors are saved we can use a QQ plot:

```r
qqnorm(ei)
qqline(ei)
```

![](STA-100-R-Handout-Week-10-Linear-Regression-Handout_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

Here, the errors looks approximately normally distributed, with small deviations at each tail.

We can also do the Shapiro-Wilks test:


```r
shapiro.test(ei)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ei
## W = 0.9826, p-value = 0.06839
```
