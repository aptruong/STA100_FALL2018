---
title: "STA100 FALL18: HW #2"
author: "April Truong"
date: "October 12, 2018"
output: 
  html_document: 
    keep_md: yes
    theme: cerulean
---



You will be working with the dataset colors.csv, which
has the following columns:
Column 1: Eye: The eye color of the subject
Column 2: Sex: The hair color of the subject
Column 3: GPA: The college GPA of the subject

# Read data

```r
colors <- readr::read_csv("C:/Users/Apple/Downloads/R Files/colors.csv")
```

```
## Parsed with column specification:
## cols(
##   Eye = col_character(),
##   Sex = col_character(),
##   GPA = col_double()
## )
```
```


#(a) Plot a barplot of the eye color of the subjects. What color is the least common?

```r
Eye.table = table(colors$Eye)
barplot(Eye.table, main = "Eye Color of All Subjects")
```

![](HW_2_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
> least common color: green


#(b) Plot a two category barplot of the subjects, using sex and eye color. Comparing men and women, who has a higher probability of brown eyes?

```r
Sex.Eye.table = table(colors$Sex,colors$Eye)
barplot(Sex.Eye.table,main = "Sex by Eye Color", beside = TRUE,legend = rownames(Sex.Eye.table))
```

![](HW_2_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
> gender with higher probability of brown eyes: female


#Plot a mosaic plot of sex and eye color.   

```r
mosaicplot(Sex.Eye.table)
```

![](HW_2_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
## (c) Are there more males or females in the study?
> more males or females in study: female

## (d) Do males or females tend to have a higher probability of blue eyes?
> gender w/ higher probability of blue eyes: female

##(e) What eye color is least common for males?
> least common eye color for male: green


#(f) Plot a histogram of GPA. What is the most common interval of GPA?

```r
hist(colors$GPA, main="GPA for All Subjects", xlab="GPA")
```

![](HW_2_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
> #most common interval: 3.3 - 3.4


# Plot a grouped boxplot of GPA by gender. 

```r
boxplot(GPA ~ Sex, data = colors, horizontal = TRUE, main = "GPA by Gender") 
```

![](HW_2_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
## (g) Do males or females have a lower median GPA?
> gender w/ lower median GPA: male

##(h) Do males or females have more outliers?
> gender w/ more outliers: male


# Plot a grouped boxplot of GPA by eye color

```r
boxplot(GPA ~ Eye, data = colors, horizontal = TRUE, main = "GPA by Eye Color")  
```

![](HW_2_files/figure-html/unnamed-chunk-7-1.png)<!-- -->
##(i) Which eye color has the highest minimum?
> eye color w/ highest min.: hazel

##(j)  Which eye color has the highest maximum?
>eye color w/ highest max.: brown
