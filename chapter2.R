a=5
a=9

c=5*3
x =c+a
x<-c+a

#The getwd() function shows the working directory


getwd()
#R uses forward slashes instead of backward slashes in filenames
setwd("E:/DataScience")
# The c function is widely used to combine values to form a vector.
x <- c(1,2,3,5) 
mean(x)
sum(x)
# R uses NA to represent Not Available, or missing values.
y <- c(1,2,3,NA,5)
mean(y)
# To calculate sum excluding NA, use na.rm =  TRUE (By default, it is FALSE).
mean(y,na.rm = T)
sum(y,na.rm = T)

#The form 1:10 generates the integers from 1 to 10.
1:10
sample(1:10, replace = F)
#Import CSV File to R
mydata <- read.csv("c:/groups.csv", header=TRUE)
#Open Table/ Function in R
fix(mydata)
fix(colSums)
#It opens the source code of a function. 
#Alternatively, you can use the debug() function to view the backend code.
debug(colSums)
View(iris)

iris = iris[-c(5)]

colSums(iris)

str(mydata)
#Install and Load Packages
install.packages("dtplyr")

install.packages("arules")

library(arules)

install.packages("dplyr")
install.packages("sas7bdat")
install.packages("dtplyr","plyr")
library(dplyr,dtplyr)
library("sas7bdat","dplyr")
#Save data in CSV format
write.csv(mydata, "file1.csv")
#Save data in R
save.image("mydata.RData") # some warning msg is here
#To load RData
load("mydata.RData") 

#To tell R which data set to use
attach(mydata)
help("read.csv")
??read.csv
# read data in R
data1 <- read.csv(file.choose(),header = TRUE)
data1
print(data1)
median(data1$GroupCategoryID)
data2 <- read.table(file.choose(),header = TRUE,sep = ",")
data2

data3 <- read.delim(file.choose(),header = T)
data3

data4 <- read.csv("c:/groups.csv", header=T)
data("Nile")

View(Nile)

data("Groceries")
View(Groceries)
inspect(Groceries)

data4

