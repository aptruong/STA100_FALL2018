---
title: "HW#6 (hands & iq)"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
---



# I. On Canvas under Files you will find a datasetIQ.txt(orIQ.csv). It has two columns, the first of which denotes what major a student is from (A, B, or C). The second is the IQmeasured by the  Stanford-Binet Intelligence Scales. The goal is to determine if this IQ measure differs between majors.

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

## make sure packages downloaded

```r
#install.packages("asbio")
library(asbio)
```

```
## Loading required package: tcltk
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


## confidence levels

```r
#bonfCI(IQ$iq, IQ$group, conf.level = 0.95)
#syntax: bonfCI(datasetname$numericcolumnname, datasetname$groupcolumnname,conf.level = 1-alpha)
```

**(Ia) lower bound for f-wise 95% CI(muA - muB), k = 3**
>-5.69471

**(Ib) upper bound for f-wise 95% CI(muA - muB), k = 3**
> 5.56138

**(Ic) lower bound for f-wise 95% CI(muA - muC), k = 3**
>-18.02805

**(Id) upper bound for f-wise 95% CI(muA - muC), k = 3**
>-6.77195
 
**(Ie) lower bound for f-wise 95% CI(muB - muC), k = 3**
>-17.96138

**(If) upper bound for f-wise 95% CI(muB - muC), k = 3**
>-6.70529 

**(Ig) largest sig. diff. in avgs.**
>-18.02805

**(Ih) smallest sig. diff. in avgs.**
>-6.70529

**(Ii) two majors most sig. diff.**
>A C
