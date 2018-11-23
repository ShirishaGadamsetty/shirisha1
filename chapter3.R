# Create a vector
x = c(1,2,4,5,NA,5,5,6,9)
y = c(1,2,3,4,56,7,8,9,5)
x+y
z= sum(x+y,na.rm=T)

#Character vector
State <- c("DL", "MU", "NY", "DL", "NY", "MU")
#To calculate frequency for State vector, you can use table function.
table(State)
#To calculate mean for a vector, you can use mean function.
mean(z)
#You can use subscripts to refer elements of a vector.
sum(z[c(1,1)])
#Convert a column "x" to numeric
x = as.numeric(x)
x
z
# factor example
#data structure to store categorical variables. 
#It tells R that a variable is nominal or ordinal by making it a factor
gender <- c(1,2,1,2,1,2)
gender <-as.factor(gender)
gender

gender <- factor(gender, levels = c(1,2),labels = c("m","f"))

table(gender)
mode(gender)

#Convert a column "x" to factor
x = as.factor(x)
x
#create a matrix
#All values in columns in a matrix must have the same mode 
#(numeric, character, etc.) and the same length.
a  = c(1,1,3,3)
b = c(1,2,3,4)

#The cbind function joins columns together into a matrix
matrixx = cbind(a,b)
age=c(12,45,56,78)

matrixx =as.data.frame(matrixx)
#To see dimension of the matrix, you can use dim function.
dim(matrixx)

#To see correlation of the matrix, you can use cor function.
cor(matrixx)


matrixx[3,]
matrixx[1,3]

matrixx[1:2,1:2]
#create a list

list1x = list(a,b)
list1x

dtaframe = data.frame(a,b,age)



#How to know data type of a column
x <- 1:16
 x <- factor(x)

 class(x) 
 mode(x) 
 