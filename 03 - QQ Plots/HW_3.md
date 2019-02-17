---
title: "Untitled"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
    theme: cerulean
---



Online you will find the filestudent.csv. It containsinformation on 1548 introduction to statistics students,and has the following columns:
Column 1:height:  The height of the student.  
Column 2:hsGPA: The high school GPA of the student.  
Column 3:pulse:  The pulse rate of the student whenmeasured in class.  

#read data

```r
student <- readr::read_csv("C:/Users/Apple/Downloads/R Files/student.csv")
```

```
## Parsed with column specification:
## cols(
##   height = col_double(),
##   hsGPA = col_double(),
##   pulse = col_double()
## )
```

```r
library(tidyverse)
```

```
## -- Attaching packages ---------------------- tidyverse 1.2.1 --
```

```
## v ggplot2 3.1.0     v purrr   0.2.5
## v tibble  1.4.2     v dplyr   0.7.8
## v tidyr   0.8.2     v stringr 1.3.1
## v readr   1.3.1     v forcats 0.3.0
```

```
## -- Conflicts ------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

#(a) Plot a QQ plot (normal probability plot) of students heights

```r
colnames(student)
```

```
## [1] "height" "hsGPA"  "pulse"
```

```r
qqnorm(student$height, main = "Normal Probability Plot for Student Height")
qqline(student$height)
```

![](HW_3_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
> yes  

#(b) Plot a QQ plot (normal probability plot) for students pulse.

```r
qqnorm(student$pulse,main = "Normal Probability Plot for Student Pulse")
qqline(student$pulse)
```

![](HW_3_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
> no

#(c) Plot a QQ plot (normal probability plot) for highschool GPA.

```r
qqnorm(student$hsGPA,main = "Normal Probability Plot for Student Hs GPA")
qqline(student$hsGPA)
```

![](HW_3_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
>no

#(d) What proportion of the data for students height lies within one standard deviation from the mean?

```r
X = student$height
the.mean = mean(X)
the.sd = sd(X)
one.sd.away = mean(X < the.mean + the.sd & X > the.mean - the.sd)
one.sd.away
```

```
## [1] 0.735
```
>73.5%

#(e) What proportion of the data for students pulse lies within two standard deviation from the mean?

```r
X = student$pulse
the.mean = mean(X)
the.sd = sd(X)
two.sd.away = mean(X < the.mean + 2*the.sd & X > the.mean - 2*the.sd)
two.sd.away
```

```
## [1] 0.96
```
>96%

#(f) What proportion of the data for highschool GPA lies within three standard deviation from the mean?

```r
X = student$hsGPA
the.mean = mean(X)
the.sd = sd(X)
three.sd.away = mean(X < the.mean + 3*the.sd & X > the.mean - 3*the.sd)
three.sd.away 
```

```
## [1] 0.985
```
>0.985

