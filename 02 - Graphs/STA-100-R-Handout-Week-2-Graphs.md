---
title: "STA 100 - Graphs"
author: "Erin K. Melcon"
output: 
  html_document: 
    keep_md: yes
---

For this handout, we will be using the built in dataset `mtcars`, as well as manually inputting data on US Berkeley admissions.

To input the UC Berekley data, copy and paste the following commands:
**NOTE: You do not have to do the following for your homework, since you will be reading in data via txt or csv.  This is adding data that is not in R or a .csv .**

```r
gender = rep(c("female","male"),c(1835,2691))
admitted = rep(c("yes","no","yes","no"),c(557,1278,1198,1493))
dept = rep(c("A","B","C","D","E","F","A","B","C","D","E","F"),
           c(89,17,202,131,94,24,19,8,391,244,299,317))
dept2 = rep(c("A","B","C","D","E","F","A","B","C","D","E","F"),
            c(512,353,120,138,53,22,313,207,205,279,138,351))
department = c(dept,dept2)
ucb = data.frame(gender,admitted,department)
rm(gender,admitted,dept,dept2,department)
```
Again, you DO NOT need to use any of the above code for your homework.  It is creating data so that everyone can use it in this handout.

To see format of the data, we can use the command `head(ucb)`:

```r
head(ucb)
```

```
##   gender admitted department
## 1 female      yes          A
## 2 female      yes          A
## 3 female      yes          A
## 4 female      yes          A
## 5 female      yes          A
## 6 female      yes          A
```

### 1.1 Histograms
The basic format for a histogram in R is:

`hist(thedataset$numericcolumn)`

where `thedataset` is the name of your dataset, and `numericcolumn` is the name of the numeric column for which you want to make a histogram.  We can make this a bit fancier by adding a title for the x axis and a main title:

`hist(thedataset$numericcolumn, xlab = "The label for the X",main = "The main title")`

Where you can replace the sentences in between the "" with whatever text you want.  

For example, if I wanted a histogram for the column labeled `mpg` in `mtcars`, the simpliest one is:


```r
hist(mtcars$mpg)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

If I wanted to add the titles:

```r
hist(mtcars$mpg,xlab = "Miles per Gallon",main = "Distribution of Miles Per Gallon")
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

### 1.2 Boxplot without grouping
To make a boxplot for one numeric column, the basic format is:

`boxplot(thedataset$numericcolumn)`

where `thedataset` is the name of your dataset, and `numericcolumn` is the name of the numeric column for which you want to make a boxplot  We can make this a bit fancier by adding a title for the x axis and a main title, and specifying if we want the boxplot to be horizontal:

boxplot(thedataset$numericcolumn, xlab = "The label for the X",main = "The main title", horizontal = TRUE)

For example, if I wanted a histogram for the column labeled `mpg` in `mtcars`, the simpliest one is:


```r
boxplot(mtcars$mpg)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

If I wanted to add the titles and have it be horizontal:

```r
boxplot(mtcars$mpg,xlab = "Miles per Gallon",main = "Distribution of Miles Per Gallon",horizontal = TRUE)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

### 1.3 Boxplots by groups
Suppose I wanted to look at the boxplots per group - for example in the `mtcars` dataset I wanted to look at the boxplot of mpg, one for each cylinder.  This is a grouped boxplot. 

The basic format for this in R is:

`boxplot(numericcolumn ~ groupcolumn, data = thedataset)`

Where the first thing you replace is the name of your numeric column (`numericcolumn`), then the name of the labeling/grouping column (`groupcolumn`), then the name of your dataset (`thedataset`).   

For example, to do mpg per cylinder:


```r
boxplot(mpg ~ cyl, data = mtcars)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

I can still add the titles and make them horizontal, with the same commands as before:


```r
boxplot(mpg ~ cyl, data = mtcars,horizontal = TRUE, xlab = "Mile per Gallon", main = "MPG per Cylinder")
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

### 2.1 Making a frequency `table` out of categorical data - One categorical variable
For most of these plots, making a table with the categories, and the frequency of each category, will be very useful.  To do that for a single categorical variable (or a single column), we can use the `table` function.  To make a one-row table, the generic command is:

`table(mydataset$groupcolumn)`

Where you would replace `mydataset` with the name of your dataset, and `groupcolumn` with the name of the column you are interested in.   Typically it is a good idea to save the result.  Lets say I am interested in the `department` column for the UCB dataset:


```r
my.table = table(ucb$department)
my.table
```

```
## 
##   A   B   C   D   E   F 
## 933 585 918 792 584 714
```
The first command created an `object` in `R` that stored the results of the command `table(ucb$admitted)` (making a frequency table of the categorical variable `admitted` in the dataset `ucb`), and the second prints the results of whatever is in `my.table`.

### 2.2 Making a frequency `table` out of categorical data - Two categorical variables

Now, suppose I wanted a bigger table, which uses information from two categorical variables. The generic command would be: 

`table(mydataset$groupcolumn1, mydataset$groupcolumn2)`

Where you would replace `mydataset` with the name of your dataset, and `groupcolumn1` with the name of the first column you are interested in, and `groupcolumn2` with the name of the second column you are interested in. 

For example, if I wanted a table for the department AND who was admitted, I would use the following commands (saving the table and then printing it):


```r
my.bigger.table = table(ucb$department,ucb$admitted)
my.bigger.table
```

```
##    
##      no yes
##   A 332 601
##   B 215 370
##   C 596 322
##   D 523 269
##   E 437 147
##   F 668  46
```

### 3.1 Bar plots for one categorical variable
Now we will look at plots for categorical data.  For example, perhaps I want a bar plot of the different programs at Berekley.  First, lets find the column names:


```r
names(ucb)
```

```
## [1] "gender"     "admitted"   "department"
```

Now, we make either a one-row or two-row table (like above).  

The column name is department.  The basic plot command is:

`your.table = table(mydataset$groupcolumn)`
`barplot(your.table)`

For example, to make my bar plot I would do:

```r
dept.table = table(ucb$department)
barplot(dept.table)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

I could also add a main plot title, like before:

```r
barplot(dept.table,main = "Popularity of Department")
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

### 3.2 Bar plots for two categorical variables
Now, all I have to change is I have to make a bigger table, and then use a similar command:

`your.table = table(mydataset$groupcolumn1,mydataset$groupcolumn2)`
`barplot(your.table,beside = TRUE,legend = rownames(your.table))`

For example, to look at who was admitted by department:


```r
dept.admit.table = table(ucb$admitted,ucb$department)
barplot(dept.admit.table,main = "Admittance by Department",beside = TRUE)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-14-1.png)<!-- -->

To tell which bar is which, I want to add a legend:


```r
barplot(dept.admit.table,main = "Admittance by Department",beside = TRUE,legend = rownames(dept.admit.table))
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

### 3.3 Swapping the order
Notice what happens if I swap the order of the two columns:


```r
dept.admit.table = table(ucb$department,ucb$admitted)
barplot(dept.admit.table,main = "Admittance by Department",beside = TRUE,legend = rownames(dept.admit.table))
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

It gives similar information, but in a different format.  It groups by the oppisite variable as before.

### 4.1 Moasic Plots.
Since we already made the two tables above, all I would need to do is use a different function (`mosaicplot`).  The general format would be to make your table first, then use the following:

`moasicplot(your.table)`

For example, to make a one-category moasic plot, I'll use the table I already saved above (called `dept.table`):


```r
mosaicplot(dept.table)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

And for a two-category plot, I would use the larger table I made above (called `dept.admit.table`):

```r
mosaicplot(dept.admit.table)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

Again, if I swaped the order I would get a slightly differenct plot:


```r
dept.admit.table = table(ucb$admitted,ucb$department)
mosaicplot(dept.admit.table)
```

![](STA-100-R-Handout-Week-2-Graphs_files/figure-html/unnamed-chunk-19-1.png)<!-- -->
