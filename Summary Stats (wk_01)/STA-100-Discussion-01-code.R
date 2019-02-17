########################
# STA 100 Discussion 1 #
########################

# Hashtag "#" is telling R that everything comes after the hashtag is developers' comments.
# To run the code line by line, you can press command and return on a mac.

## 1. Data type
# R contains many data types. It is important to know which data type you are dealing with.
#   Sometime, bugs are due to data types. The following are some examples of data types R.

# 1. character
# If you want to input characters or strings, you need to wrap the text with either double 
#   or single quotation mark.

"a"
"genius"
"You are a genius."

# We can type the following to check the type of the object.
typeof("genius")


# 2. Numeric
1
1.2

# There are other functions to check the data type of an object. Most of the time, \
#   it doesn't matter.
class(1)
typeof(1)
class(1.2)
typeof(1.2)


# 3. Vector
c(1, 2, 3)
typeof(c(1, 2, 3))

# Note you cannot store different data type in the same vector.
#   R will try to coerce everything into the same data type.
c(1, TRUE, "genius")
class(c(1, TRUE, "genius"))
class(c(1, TRUE, "genius")[1])

# 4. List 
list(1, 2, 3)
typeof(list(1, 2, 3))

# You can store different data type in a slit
my_list = list(1, c("x", "y", 1), 3, TRUE)
class(my_list)
class(my_list[[1]])
class(my_list[[2]])


# To access entry i in the list, there are two options. 
#   You can use either my_list[i] or my_list[[i]].
#   There is difference between these two ways.
my_list[1]
class(my_list[1])
my_list[[1]]
class(my_list[[1]])

# The difference is well summarized through a picture on the following page.
#   https://stackoverflow.com/questions/1169456/the-difference-between-bracket-and-double-bracket-for-accessing-the-elem

# 5. Data Frame
# We will create a data frame here.
# 5.1 Create a varaible
bike_brand = c("BMC", "Trek", "Specialized")
bike_model = c("Roadmachine", "Domane", "Roubaix")
bike_price = c(5499, 5499, 6500)
# As we create a variable, the varaible will appears in the Global Enviroment. 
#   R can only "see" what's in the global enviroment.

# Now we create a data frame of which the name is bike_data_frame.
bike_data_frame = data.frame(cbind(bike_brand, bike_model, bike_price),
                             stringsAsFactors = FALSE)
bike_data_frame
class(bike_data_frame)

# Removed the each bike variables from the enviroment and we see an error message.
rm(bike_brand, bike_model, bike_price)
bike_brand
# The variable is stored in the data_frame, to access the variable we need to tell R
#   where to search for.
bike_data_frame$bike_brand
bike_data_frame[, 1]
  
# There are two ways of creating variables.
my_budget = 100
my_budget <- 100

# Most of the time two assignment operators behave in a similar fashions. For more comparison,
#   check the post on Stack Overflow (What are the differences between “=” and “<-” in R?).    
#   https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-in-r


## 2. Functions
# Every opertaion in R is a function call.
# Basic arithmetics
2 * 3
prod(2, 3)

2 + 3
sum(2, 3)

# Functions in R usually have some arguments allows you to handle different scenarios.
#   You may find out more details by use "?" operator.
x = c(1, 2, 3, 4)
mean(x)

x = c(1, 2, 3, NaN)
mean(x)
?mean
mean(x, na.rm = TRUE)

#######################
# Tips for learning R #
#######################
# 1. It is better to pick things up gradually as you tackling your tasks instead of 
#   trying to every aspect of R at the begining.
# 2. Google is your best friend! Seriously, learning programming essentially is learning 
#   how to Google. Your task is figuring out what you want to do, then Google will take care of 
#   the rest.
# 3. Websites such as Stack Overflow and Stack Exchange are great resources to learn about R.
#   Millions have learnt R before you and I, so the questions you and I have probably have been 
#   asked and solved. Usually, Google will show results from those websites.


#######################
# Discussion problems #
#######################

## Load data
# When we load the data from the data file, we save the data as a data frame
# There are different ways of loading the data. 
# 1. Give the full path when loading the data.

######################################################################
# change "~/Documents/TA/sta_100/data/" to the path on your computer #
######################################################################

patients101 <- read.csv("~/Documents/TA/sta_100/data/patients101.csv")
class(patients101)

# 2. Change the working directory to where you want to store the data.
getwd()

##############################################################################################
# change "~/Documents/TA/sta_100/" to the folder where you store your data  on your computer #
##############################################################################################
setwd("~/Documents/TA/sta_100/data/")
patients101 = read.csv(("patients101.csv"))

## (a) Find the average systolic blood pressure of all sub-jects
mean(patients101$sysBP)

## (b) Find  the  standard  deviation  of  systolic  blood  pres-sure of all subjects
sd(patients101$sysBP)

## (c) Find the average of weight of all subjects
mean(patients101$weight)

## (d) Find the average of height of all subjects
mean(patients101$height)

## (e) Find the average of weight by gender
aggregate(patients101$weight, by = patients101$gender, mean)
# What's wrong with R???
class(patients101$gender)
# by argument asks for an object of data type list. 
# patients101$gender is a vector. We can change it to a list.
class(list(patients101$gender))

aggregate(patients101$weight, by = list(patients101$gender), mean)
aggregate(weight ~ gender, FUN = mean, data = patients101)

## (f) Find the standard deviation of height by gender
aggregate(patients101$height, list(patients101$gender), sd)

## (g) Which marriage category has the most subjects
aggregate(height ~ marriage, data = patients101, length)
# table function is a useful function when you want to count the number of 
#   each unique values in an R object such as vector.
table(patients101$marriage)

## (h) Find  the  average  weight  for  married  and  divorcedsubjects
aggregate(weight ~ marriage, data = patients101, mean)




