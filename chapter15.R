#1. Apply Function
dat <- data.frame(x = c(1:5,NA),
                  z = c(1, 1, 0, 0, NA,0),
                  y = 5*c(1:6))
#Example 1 : Find Maximum value of each row
apply(dat, 1, max, na.rm= TRUE) #In the second parameter of apply function, 1 denotes the function to be applied at row level.

#Example 2 : Find Maximum value of each column
apply(dat, 2, max, na.rm= TRUE)
#2. Lapply Function
#Example 1 : Calculate Median of each of the variables
lapply(dat, function(x) median(x, na.rm = TRUE))
#Example 2 : Apply a custom function
lapply(dat, function(x) x + 1)
#3. Sapply Function
#Example 1 : Number of Missing Values in each Variable
sapply(dat, function(x) sum(is.na(x)))
#Example 2 : Extract names of all numeric variables in IRIS dataset
sapply(iris,is.numeric)
which(sapply(iris,is.numeric))#returns the column position of the numeric variables
colnames(iris)[which(sapply(iris,is.numeric))]#return the actual names of the numeric variables.

#Lapply and Sapply Together
dat <- data.frame(x = c(1:5,NA),
                  z = c(1, 1, 0, 0, NA,0),
                  y = factor(5*c(1:6)))
dat
#Converting Factor Variables to Numeric
index <- sapply(dat, is.factor)# returns t or f
index
dat[index] <- lapply(dat[index], function(x) as.numeric(as.character(x)))
class(dat)
#4. For Loop
#Example 1 : Maximum value of each column
x = NULL
for (i in 1:ncol(dat)){
  x[i]= max(dat[i], na.rm = TRUE)
  }
x[0]
#The above FOR LOOP program can be written like the code below -
x = vector("double", ncol(dat))# create empty vector
for (i in seq_along(dat)){ # seq_along finds out what to loop over.
  x[i]= max(dat[i], na.rm = TRUE)}
x 
#Example 2 : Split IRIS data based on unique values in "species" variable
for (i in 1:length(unique(iris$Species))) {
  require(dplyr)
  assign(paste("iris",i, sep = "."), filter(iris, Species == as.character(unique(iris$Species)[i])))
}
#Combine / Append Data within LOOP
#Method 1 : Use do.call with rbind
temp =list()
for (i in 1:length(unique(iris$Species))) {
  series= data.frame(Species =as.character(unique(iris$Species))[i])
  temp[[i]] =series
}
output = do.call(rbind, temp)
output
#Method 2 :  Use Standard Looping Technique
dummydt=data.frame(matrix(ncol=0,nrow=0))
for (i in 1:length(unique(iris$Species))) {
  series= data.frame(Species =as.character(unique(iris$Species))[i])
  if (i==1) {output = rbind(dummydt,series)}  else {output = rbind(output,series)}
}
output
#data$variable won't work inside the code . Instead we should use data[[variable]]. See the code below -
dummydt=data.frame(matrix(ncol=0,nrow=0))
temp = function(data, var) {
  for (i in 1:length(unique(data[[var]]))) {
    series= data.frame(Species = as.character(unique(data[[var]]))[i])
    if (i==1) {output = rbind(dummydt,series)}  else {output = rbind(output,series)}
  }
  return(output)}
temp(iris, "Species")
#For Loop and Sapply Together
for (i in which(sapply(dat, is.numeric))) {
  dat[is.na(dat[, i]), i] <- median(dat[, i],  na.rm = TRUE)
}
#Create new columns in Loop
mydata = data.frame(x1=sample(1:100,100), x2=sample(letters,100, replace=TRUE), x3=rnorm(100))
#Standardize Variables
lst=list()
for (i in which(sapply(mydata, is.numeric))) {
  x.scaled = (mydata[,i] - mean(mydata[,i])) /sd(mydata[,i])
  lst[[i]] = x.scaled
}

names(lst) <- paste(names(sapply(mydata, is.numeric)),"_scaled", sep="")
mydata.scaled= data.frame(do.call(cbind, lst))
#5. While Loop in R
i=1
while(i<7)
{
  if(i%%2==0)
    print(paste(i, "is an Even number"))
  else if(i%%2>0)
    print(paste(i, "is an Odd number"))
  i=i+1
}
#Loop Concepts : Break and Next
for (i in 1:3) {
  for (j in 3:1) {
    if ((i+j) > 4) {
      break    } else {
        print(paste("i=", i, "j=", j))
      }
  }
}
for (i in 1:3) {
  for (j in 3:1) {
    if ((i+j) > 4) {
      next
    } else {
      print(paste("i=", i, "j=", j))
    }
  }
}
