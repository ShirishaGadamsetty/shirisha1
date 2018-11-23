#READING LARGE CSV FILE WITH R

#Method I : Using data.table library 
library(data.table)
yyy = fread("C:\\Users\\Deepanshu\\Documents\\Testing.csv", header = TRUE)

#Method II : Using bigmemory library
library(bigmemory)
y <- read.big.matrix("C:\\Users\\Deepanshu\\Documents\\Testing.csv", type = "integer", header=TRUE)
dim(y)
#coerce a big.matrix to a matrix
yy= as.matrix(y)
