---
title: "HW#7 (beans & blood)"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
---



#I. Biologists wanted to know if a particular parasite (wee-vils) had a preference for a particular bean plant. The results are stored inbeans.csv, where  the  result was which plant the weevil preferred (Pinto,Cowpea,Navy,Northern). Use this data and R, and assume the claim is that weevils are equally likely to select all bean plants.

## read data

```r
beans <- read.csv("C:/Users/Apple/Downloads/R Files/beans.csv")
```

##(Ia) Find t-s

```r
beans.table = table(beans$plant)
beans.table
```

```
## 
##   Cowpea     Navy Northern    Pinto 
##      155      155      192      144
```

```r
the.test = chisq.test(beans.table,p = c(1/4,1/4,1/4,1/4),correct = FALSE)
the.test$statistic
```

```
## X-squared 
##  8.179567
```
> 8.179567 

##(Ib) Find p-val


```r
the.test$p.value
```

```
## [1] 0.04244278
```
>0.04244278

##(Ic) Reject or fail null (if a=0.05)
> p-val(0.04)<a(0.05) --> REJECT 

##(Id) Which did weevils prefer more than expected (if null true)

```r
the.test$expected
```

```
##   Cowpea     Navy Northern    Pinto 
##    161.5    161.5    161.5    161.5
```

```r
beans.table-the.test$expected
```

```
## 
##   Cowpea     Navy Northern    Pinto 
##     -6.5     -6.5     30.5    -17.5
```

```r
the.test$residuals^2
```

```
## 
##    Cowpea      Navy  Northern     Pinto 
## 0.2616099 0.2616099 5.7600619 1.8962848
```
>northern

##(Ie) category contributed most to t-s

```r
beans.table-the.test$expected
```

```
## 
##   Cowpea     Navy Northern    Pinto 
##     -6.5     -6.5     30.5    -17.5
```

```r
the.test$residuals^2
```

```
## 
##    Cowpea      Navy  Northern     Pinto 
## 0.2616099 0.2616099 5.7600619 1.8962848
```
>northern


#II. On Canvas you will find the fileblood.csv, which has two columns: Type(for blood type), and Disease(eitheryes or no), which is data taken from a random samplefrom a particular area. Use R and this data to answerthe following questions:

##read data

```r
blood <- read.csv("C:/Users/Apple/Downloads/R Files/blood.csv")
```

##(IIa) null
> H0: p(disease|A)=p(disease|B)=p(disease|AB)=p(disease|O)

##(IIb) alt


##(IIc) t-s

```r
two.cat = table(blood$Disease,blood$Type)
two.cat
```

```
##      
##         A  AB   B   O
##   No  500  50 222 123
##   Yes 140  10  60   7
```

```r
disease.type.table = table(blood$Disease,blood$Type)
another.test = chisq.test(disease.type.table,correct = FALSE)
another.test$statistic
```

```
## X-squared 
##    19.663
```
>19.663

##(IId) p-val

```r
another.test$p.value
```

```
## [1] 0.000199345
```
>0.000199345

##(IIe) Conclusion (a=0.01)
>p-val(0.00)<a(0.01) --> REJECT (not independent)

##(IIf) blood type A more or less likely to have disease (if null true)

```r
another.test$observed - another.test$expected
```

```
##      
##                A         AB          B          O
##   No  -15.107914   1.708633  -4.969424  18.368705
##   Yes  15.107914  -1.708633   4.969424 -18.368705
```

```r
another.test$residuals^2
```

```
##      
##                 A          AB           B           O
##   No   0.44310920  0.06045443  0.10880399  3.22474576
##   Yes  1.82757020  0.24933970  0.44875379 13.30021868
```
>(-)=less than expected, (+)=more than expected
>more likely

##(IIg) blood type O
>less likely

##(IIh) group contributed most to t-s
>group O blood, yes

