5*3
getwd()
setwd("E:/DataScience")
x <- c(1,2,3,5) 
mean(x)
sum(x)
y <- c(1,2,3,NA,5)
mean(y)
mean(y,na.rm = T)
sum(y,na.rm = T)
1:10
mydata <- read.csv("c:/groups.csv", header=TRUE)
fix(mydata)
fix(colSums)
debug(colSums)
colSums()
install.packages("dplyr")
install.packages("sas7bdat")
install.packages("dtplyr","plyr")
library(dplyr,dtplyr)
library("sas7bdat","dplyr")
write.csv(mydata, "file1.csv")
save.image("mydata.RData") # some warning msg is here
load("mydata.RData") 
attach(mydata)
help("read.csv")
?read.csv
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

# Create a vector
x = c(1,2,4,5,NA,5,5,6,9)
y = c(1,2,3,4,56,7,8,9,5)
z= sum(x+y,na.rm=T)



# factor example
gender <- c(1,2,1,2,1,2)
gender <-as.factor(gender)

gender <- factor(gender, levels = c(1,2),labels = c("male","female"))

table(gender)
mode(gender)

#create a matrix

a  = c(1,1,3,3)
b = c(1,2,3,4)
matrixx = cbind(a,b)
age=c(12,45,56,78)

matrixx =as.data.frame(matrixx)

#create a list

list1x = list(a,b)

dtaframe = data.frame(a,b,age)

  

data4

library(data.table)
mydata = fread("c:/groups.csv")

mydata <- read.csv("c:/groups.csv", header=TRUE)
mydata1 <- read.csv("c:/groups.csv", header=TRUE, na.strings=".")
mydata1
mydata2 <- read.csv("c:/groups.csv", header=TRUE, na.strings=  c("A" , "B" ))
mydata2                   

read_excel("groupsxls.xls")                    
loadhistory("~/groupsxls.xltx")
excel_format("c:/groupsxls", guess = TRUE)
format_from_ext("c:/groupsxls.xltx")


files <- c(
  "a.xlsx",
  "b.xls",
  "c.png",
  file.path(R.home("doc"), "html", "logo.jpg"),
  readxl_example("clippy.xlsx"),
  readxl_example("deaths.xls")
)
excel_format(files)

read_excel("c:/groupsxls.xls", sheet = NULL,guess_max = min(1000,n_max))   



data = read.table(text="
X Y Z
                  6 5 0
                  6 3 NA
                  6 1 5
                  8 5 3", header=TRUE)
data

library(foreign)
write.foreign(data, "c:/groupstab.txt", "c:/mydata.sas",   package="SAS")
