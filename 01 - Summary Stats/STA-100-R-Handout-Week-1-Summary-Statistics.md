---
title: "STA-100 Handout 1 - Summary Statistics"
author: "Erin K. Melcon"
output: 
  html_document: 
    keep_md: yes
---
For this handout, will we be using a dataset that is already loaded into R.  For your homework, you will first have to upload the data, and include the command to do so in your code window.

The built in dataset is called `mtcars`.  To view the first few rows of a dataset, in general the command and you would type into the console would have the format:

`head(thedataset)`

(you do NOT include the single quotes above, if you are viewing the .Rmd instead of the .html) where instead of using `thedataset` you would use the name of your dataset.  For example, mine is called `mtcars`, so the code I use is:


```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

The lines of code in between the ` ``` `{r} ` ``` ` and  are what you would type into the console and hit enter to see the result.  **You do not include the tick marks!**  If you are reading the .html version of the handout, you will not see these.

To find the names of the columns in a dataset, you can use the function `names` in a similar way.  The general format would be:

`names(thedataset)`

So for our example, the correct code for our dataset named cars would be


```r
names(mtcars)
```

```
##  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
## [11] "carb"
```

### 1. Finding the mean of a column
To find the mean of a column in R, you can use the function `mean`.  This function expects only a column in your dataset, not the entire dataset.  The general format is:

`mean(thedataset$columnname)`

where instead of using `thedataset` and `columnname` is the name of the particular column you want.  For example, if I wanted the mean of the column `mpg` in the dataset `mtcars`, I would use the following command:

```r
mean(mtcars$mpg)
```

```
## [1] 20.09062
```

### 1.1 Finding the mean of a column by groups.
To find the mean of a column for every group, you need two columns - one should be a column with numeric values, and one should be a column with labels.  Then, the general format is

`aggregate( numericcolumn ~ groupcolumn, data = thedataset, mean)`

Where you would put the name of your numeric column instead of `numericcolumn`, and the name of your grouping column instead of `groupcolumn`, and replace the name of `thedataset`.  

For example, if I wanted to find the average mpg per number of gears, I would use the following:


```r
aggregate(mpg ~ gear, data = mtcars, mean)
```

```
##   gear      mpg
## 1    3 16.10667
## 2    4 24.53333
## 3    5 21.38000
```
**Note that R goes by alphabetical order if your group names are words**.

### 2. Rounding and saving variables
For inputting your results into Canvas, you will usually want to round your result to some number of digits.  To do this, we will learn how to save a result in R, and use another function to round the result.

### 2.1 Saving a result in R
Sometimes we do not want to print the result right away, but we want to save it and use it later.  For example, if I wanted to save the mean but not print it until I round it, I would do the following:

`the.mean = mean(dataset$columnname)`

This saves the result of mean(dataset$columnname) in the object the.mean in R.  The name the.mean is completely arbitrary, and could be anything you want, with a few exceptions. 

**The name cannot have a space in it, start with a number, or have most specical characters (such as &, %, etc).  Names are also case sensitive**

But, now I can save the mean of the mpg column as follows:


```r
the.mean = mean(mtcars$mpg)
```
**When you put this command in your console and press enter, you will not see the result.   This is ok!! It means the result has been saved, and I can now use it for other things.  If I want to see the result, I can type the.mean in the console to see what the mean was.**


```r
the.mean
```

```
## [1] 20.09062
```

### 2.2 Accessing the results of aggregate
We have already learned how to use the function `aggregate` above, but notice that the object returned had two columns.  If we want to access just one of the columns, we can use the $ operator in R.  First, I will save the result of aggregate as something, then access just the columns with the means.


```r
many.means = aggregate(mpg ~ gear, data = mtcars, mean)
many.means$mpg
```

```
## [1] 16.10667 24.53333 21.38000
```
This gives a list of all of the means of all of the groups.  To see which order they were in, I could look at the column called (in my case) gear:

```r
names(many.means)
```

```
## [1] "gear" "mpg"
```

```r
many.means$gear
```

```
## [1] 3 4 5
```
Now I know that the value 16.10667 corresponds to the group 3. 

### 2.3 Rounding a list of things or a single number.  
It will be very important to round your result before you give it to Canvas to grade.  To do that, there is a function called round.  This function rounds a single number, or a list of numbers, but not a dataset.  The general format is

`round(thething, digit)`

where thething is the list or number you want to round, and digit is a number specifying how many decimal places.  For example, I will round the mean of the mpg column, and also the list of the average mpg per gear group:

```{}
round(the.mean, 3)
round(many.means$mpg,3)
```

Now that everything is rounded to three decimal places, I could input the result into Canvas.

### 3. Finding the standard deviation of a column
To find the standard deviation of a column, the format is very similar to that of using the function `mean`.  The general format is:

`sd(thedataset$columnname)`

Where thedataset is the name of your dataset, and columnnname is the name of the column of which you want to find the standard deviation of.  For example, if I wanted the standard deviation of the mpg column rounded to three decimal places, I would use the following commands


```r
the.sd = sd(mtcars$mpg)
round(the.sd,3)
```

```
## [1] 6.027
```

### 3.1 Finding the standard deviation per group
The general format is

`aggregate( numericcolumn ~ groupcolumn, data = thedataset, sd)`

Where you would put the name of your numeric column instead of `numericcolumn`, and the name of your grouping column instead of `groupcolumn`, and replace the name of `thedataset`.  

For example, if I wanted to find the average mpg per number of gears, I would use the following:


```r
aggregate(mpg ~ gear, data = mtcars, sd)
```

```
##   gear      mpg
## 1    3 3.371618
## 2    4 5.276764
## 3    5 6.658979
```
**Note that R goes by alphabetical order if your group names are words**.

Notice that we used the function aggregate again, but instead of the mean per group we were intereseted in the standard deviation, so we put `sd` rather than `mean`. 

### 4. Finding the five number summary
To find the five number summary of a column in your dataset, the format is again similar to the mean or standard deviation:

`fivenum(thedataset$columnname)`

For example, if I wanted to find the five number summary of the mpg column (rounded to 3 decimal places), I could use the following command:


```r
the.five = fivenum(mtcars$mpg)
round(the.five,3)
```

```
## [1] 10.40 15.35 19.20 22.80 33.90
```

### 5. The number of subjects in a group
To find the number of subjects per group, we can again use the function aggregate.  The general format is: 

`aggregate( numericcolumn ~ groupcolumn, data = thedataset, length)`

Where you would put the name of your numeric column instead of `numericcolumn`, and the name of your grouping column instead of `groupcolumn`, and replace the name of `thedataset`. 

### 6. Summary

This should be all the commands you need for your first homework assignment.  As a summary, we have learned about the following functions:

mean, sd, aggregate, round, fivenum, head, names

and how to access columns of a dataset using the $ operator and the column name.

**If you have any questions or run into errors, please post/email both your code and the error it produced from the console.**
