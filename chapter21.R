#Create a sample data frame
set.seed(456)
mydata <- data.frame(a=letters[1:5], x=runif(5,10,50), y=sample(5), z=rnorm(5))
#R : Delete column by name
df = subset(mydata, select = -c(x,z) )
#Method II :
drop <- c("x","z")
df = mydata[,!(names(mydata) %in% drop)]
#R : Drop columns by column index numbers
df <- mydata[ -c(1,3:4) ]
#R : Keep column by name
#Method I :
keeps <- c("x","z")
df = mydata[keeps]
df
#Method II :
df = subset(mydata, select = c(x,z))
df
#Keep columns by column index number
df <- mydata[c(2,4)]
#Keep or Delete columns with dplyr package
install.packages("dplyr")
#1. How to delete first, third and fourth column
library(dplyr)
mydata2 = select(mydata, -1, -3:-4)
#2. How to delete columns a, x and y
mydata2 = select(mydata, -a, -x, -y)
mydata2 = select(mydata, -c(a, x, y))
mydata2 = select(mydata, -a:-y)
#3. How to keep columns a, y and z
mydata2 = select(mydata, a, y:z)
#Keep / Drop Columns by Name Pattern
mydata = read.table(text="
INC_A SAC_A INC_B ASD_A
                    2 1 5 12
                    3 4 2 13
                    ", header=TRUE)
#Keeping columns whose name starts with "INC"
mydata1 = mydata[,grepl("^INC",names(mydata))]
#Dropping columns whose name starts with "INC"
mydata2 = mydata[,!grepl("^INC",names(mydata))]
#Keeping columns whose name contain "_A" at the end
mydata12 = mydata[,grepl("_A$",names(mydata))]
#Dropping columns whose name contain "_A" at the end
mydata22 = mydata[,!grepl("_A$",names(mydata))]
#Keeping columns whose name contain the letter "S"
mydata32 = mydata[,grepl("*S",names(mydata))]
#Dropping columns whose name contain the letter "S"
mydata33 = mydata[,!grepl("*S",names(mydata))]
#R Function : Keep / Drop Column Function
KeepDrop = function(data=df,cols="var",newdata=df2,drop=1) {
  # Double Quote Output Dataset Name
  t = deparse(substitute(newdata))
  
  # Drop Columns
  if(drop == 1){
    newdata = data [ , !(names(data) %in% scan(textConnection(cols), what="", sep=" "))]}
  
  # Keep Columns
  else {
    newdata = data [ , names(data) %in% scan(textConnection(cols), what="", sep=" ")]}
  assign(t, newdata, .GlobalEnv)
}
#How to use the above function
KeepDrop(data=mydata,cols="a x", newdata=dt, drop=0)
KeepDrop(data=mydata,cols="a x", newdata=dt, drop=1)
