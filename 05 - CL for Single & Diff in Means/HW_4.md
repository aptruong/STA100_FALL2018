---
title: "HW#4 (student & radish)"
author: "April Truong"
date: "February 16, 2019"
output: 
  html_document: 
    keep_md: yes
    theme: cerulean
---



#I. Online you will find the filestudent.csv. It containsinformation on 1548 introduction to statistics students,and has the following columns:  
Column 1:height:  The height of the student.  
Column 2:hsGPA: The high school GPA of the student.   
Column 3:pulse:  The pulse rate of the student whenmeasured in class.

## read data

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

## (1a) lower bound for 95% CI for the avg students height

```r
the.stuff = t.test(student$height, conf.level = 0.95)
the.stuff$conf.int[1]
```

```
## [1] 67.4186
```
>67.4186

## (1b) upper bound for 95% CI for the avg student height

```r
the.stuff$conf.int[2]
```

```
## [1] 68.5639
```
>68.5639

## (1c) highest avg height expect
>68.5639

## (1d) lower bound for 99% CI for avg student pulse

```r
the.stuff = t.test(student$pulse, conf.level = 0.99)
the.stuff$conf.int[1]
```

```
## [1] 71.5894
```
>71.5894

## (1e) upper bound for 99% CI for avg student pulse

```r
the.stuff$conf.int[2]
```

```
## [1] 78.0706
```
>78.0706

## (1f) lowest avg pulse expect
>71.5894


#II. You will be using the datasetRadish.csv,  which con-tains  the  growth  rate  of  radish  plants  two  weeks  aftergermination.  
The first column is the height of the plants(in  cm).   
The  second  column  is  the  treatment  group,which was either given no fertilizer (the control group,calledControl) or given fertilizer (the treatment group,calledFertilized).  
Assume the radishes were sampledrandomly and independently.  

##read data

```r
Radish <- readr::read_csv("C:/Users/Apple/Downloads/R Files/Radish.csv")
```

```
## Parsed with column specification:
## cols(
##   Height = col_double(),
##   Treatment = col_character()
## )
```

## (2a) lower bound for 90% CI for the diff b/t two groups

```r
rad.stuff = t.test(Height ~ Treatment, data = Radish, conf.level = 0.90)
rad.stuff$conf.int[1]
```

```
## [1] 0.2349151
```

```r
the.CI = round(the.stuff$conf.int,digits = 4)
the.CI[1]
```

```
## [1] 71.5894
```
>0.2349

## (2b) upper bound for 90% CI for the diff b/t two groups

```r
the.stuff$conf.int[2]
```

```
## [1] 78.0706
```

```r
the.CI[2]
```

```
## [1] 78.0706
```
> 0.8508

##(2c) The fertilizer manufacturer claims that by using their fertilizer, plants will grow more on average than if you use no fertilizer. Does your confidence intervalsupport this claim?
>no 


##(2d) largest diff in avg growth expect with 90% CI
>0.8508

