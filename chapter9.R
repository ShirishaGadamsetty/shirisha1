#DATA EXPLORATION WITH R

#Import data into R
mydata <- read.csv("c:/groups.csv", header=TRUE)
mydata = data.frame(Q1 = sample(1:6, 100, replace = TRUE),Q2 = sample(1:6, 100, replace = TRUE),Q3 = sample(1:6, 100, replace = TRUE), Q4 = sample(1:6, 100, replace = TRUE), Age = sample(1:3, 100, replace = TRUE))
mydata

#Calculate basic descriptive statistics
summary(mydata)
summary( mydata[3])
summary( mydata$Q1)

# Lists name of variables in a dataset 
names(mydata)

#Calculate number of rows in a dataset
nrow(mydata) 

#Calculate number of columns in a dataset
ncol(mydata) 

#List structure of a dataset 
str(mydata)

#See first 6 rows of dataset 
head(mydata)

#First n rows of dataset
head(mydata, n=5) 

#All rows but the last row 
head(mydata, n= -1)

#Last 6 rows of dataset 
tail(mydata)

#Last n rows of dataset
tail(mydata, n=5) 

#All rows but the first row 
tail(mydata, n= -1)
library(dplyr)

#Select random rows from a dataset
sample_n(mydata, 5)

#Selecting N% random rows
sample_frac(mydata, 0.1)

#Number of missing values
colSums(is.na(mydata))
sapply(mydata, function(y) sum(is.na(y)))

#Number of missing values in a single variable 
sum(is.na(mydata$Q1))
#exercise 9 end



