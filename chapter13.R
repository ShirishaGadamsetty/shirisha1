#If Else and Nested If Else in R
set.seed(123)
mydata = data.frame(x1 = seq(1,20,by=2), #alternate numbers starting from 1 to 20
                    x2 = sample(100:200,10,FALSE), #10 non-repeating random numbers ranging between 100 and 200.
                    x3 = LETTERS[1:10])#10 alphabets starting from A to Z.
mydata
#ifelse(condition, value if condition is true, value if condition is false)
#Example 1 : Simple IF ELSE Statement
mydata$x4 = ifelse(mydata$x2>150,1,0)# 'x2' is greater than 150, assign 1 else 0.
mydata
x = ifelse(mydata$x2>150,1,0)
newdata = cbind(x,mydata) #created binary variable in a new data frame
# cbind() is used to combine two vectors, matrices or data frames by columns.
mydata$y = ifelse(mydata$x3 %in% c("A","D") ,mydata$x1*2,mydata$x1*3) #if condt is T(X1*2) F(X1*3)
mydata
#Example 2 : Nested If ELSE Statement in R
mydata$y = ifelse(mydata$x3 %in% c("A","B") ,mydata$x1*2,
                  ifelse(mydata$x3 %in% c("C","D"), mydata$x1*3,
                         mydata$x1*4)) # if condt is T (x1*2) F(it will check condt again T(X1*3) F(X1*4))
mydata$y = with(mydata, ifelse(x3 %in% c("A","B") , x1*2,
                               ifelse(x3 %in% c("C","D"), x1*3, x1*4)))#with() function to avoid mentioning data frame each time
#Handle Missing Values
#Incorrect Method
x = NA
ifelse(x==NA,1,0)
#Correct Method 
x = NA
ifelse(is.na(x),1,0)
#Use OR and AND Operators
ifelse(mydata$x1<10 & mydata$x2>150,1,0)
with(mydata,ifelse((x1<10)& (x2>150),1,0))
ifelse(mydata$x1<10 | mydata$x2>150,1,0)
#Count cases where condition meets
sum(ifelse(mydata$x1<10 | mydata$x2>150,1,0))
#If Else Statement : Another Style
k = 99
if(k > 100) 1 else 0
#If..Else If..Else Statements
k = 100
if(k > 100){
  print("Greater than 100")
} else if (k < 100){
  print("Less than 100")
} else {
  print ("Equal to 100")
}
#If Else in Popular Packages
#1. dplyr package
library(dplyr)
x=c(1,NA,2,3)
if_else(x%%2==0, "Multiple of 2", "Not a multiple of 2", "Missing")#The %% symbol returns remainder after a value is divided by divisor
#2. sqldf package
install.packages("sqldf")
df=data.frame(k=c(2,NA,3,4,5))
library(sqldf)
sqldf(
  "SELECT *,
  CASE WHEN (k%2)=0  THEN 'Multiple of 2'
  WHEN  k is NULL  THEN 'Missing'
  ELSE 'Not a multiple of 2'
  END AS T
  FROM df"
)
