---
title: "HW#1 (pain)"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
---



#read data

```r
pain <- read.csv("C:/Users/Apple/Downloads/R Files/pain.csv")
```

# On Canvas, you will find the dataset"pain.txt". This  dataset has the following columns:
Column 1:  HairColor:  The hair color of the subject
Column 2:  Score:  The pain tolerance of the subject
Each person in the experiment was given a pain thresh-old score based on his or her performance in a pain sensitivity test (the higher the score, the higher the person's pain tolerance).

##(a)  Find the overall mean of pain tolerance, regardlessof hair color.

```r
colnames(pain)
```

```
## [1] "HairColor" "Score"
```

```r
head(pain)
```

```
##    HairColor Score
## 1 LightBlond    62
## 2 LightBlond    60
## 3 LightBlond    71
## 4 LightBlond    55
## 5 LightBlond    48
## 6  DarkBlond    63
```

```r
mean(pain$Score)
```

```
## [1] 47.84211
```

##(b)  Find  the  overall  standard  deviation  of  pain  toler-ance, regardless of hair color.

```r
sd(pain$Score)
```

```
## [1] 11.4565
```

##(c)  Find the mean pain tolerance for the category DarkBrunette. Hint: Use R to find the mean for each group.  

```r
aggregate( Score ~ HairColor, data = pain, mean)
```

```
##       HairColor Score
## 1     DarkBlond  51.2
## 2  DarkBrunette  37.4
## 3    LightBlond  59.2
## 4 LightBrunette  42.5
```

##(d)  Find the  standard deviation of pain tolerance for the category LightBrunette. Hint: Use R to find the standard deviation for each group.  

```r
aggregate( Score ~ HairColor, data = pain, sd)
```

```
##       HairColor    Score
## 1     DarkBlond 9.284396
## 2  DarkBrunette 8.324662
## 3    LightBlond 8.526429
## 4 LightBrunette 5.446712
```

##(e)  Find the number of subjects that were in the cate-gory LightBlond.Hint:  Use R to find the number of subjects for each group.  

```r
aggregate( Score ~ HairColor, data = pain, length)
```

```
##       HairColor Score
## 1     DarkBlond     5
## 2  DarkBrunette     5
## 3    LightBlond     5
## 4 LightBrunette     4
```

##(f)  Which hair color category had the highest average pain tolerance?  


#(g)  Which hair color category had the lowest standarddeviation of pain tolerance?  


#(h)  Which hair color category had the most subjects?


