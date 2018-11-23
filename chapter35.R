#R : CONVERTING MULTIPLE NUMERIC VARIABLES TO FACTOR

#Converting Numeric Variables to Factor
names <- c(1:3,5)
mydata
mydata <- data.frame()
mydata <- data.frame(mydata,names)
mydata[,names] <- lapply(mydata[,names] , factor)
mydata
str(mydata)

#     2. Using Column Names

names <- c('Credit' ,'Balance')
mydata <- data.frame(mydata,names)
mydata[,names] <- lapply(mydata[,names] , factor)

str(mydata)
?lapply


#    3.  Converting all variables
col_names <- names(mydata)

mydata[,col_names] <- lapply(mydata[,col_names] , factor)

#    4.  Converting all numeric variables
mydata[sapply(mydata, is.numeric)] <- lapply(mydata[sapply(mydata, is.numeric)], as.factor)

#    5. Checking unique values in a variable and convert to factor only those variables having unique count less than 4
col_names <- sapply(mydata, function(col) length(unique(col)) < 4)
mydata[ , col_names] <- lapply(mydata[ , col_names] , factor)



require(stats); require(graphics)
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
x
# compute the list mean for each list element
y<- lapply(x, mean)
y

# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)

i39 <- sapply(3:10, seq) # list of vectors

i39
sapply(i39, fivenum)
fivenum()
vapply(i39, fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))
## sapply(*, "array") -- artificial example
(v <- structure(10*(5:8), names = LETTERS[1:4]))
f2 <- function(x, y) outer(rep(x, length.out = 3), y)
f2
(a2 <- sapply(v, f2, y = 2*(1:5), simplify = "array"))
a.2 <- vapply(v, f2, outer(1:3, 1:5), y = 2*(1:5))
stopifnot(dim(a2) == c(3,5,4), all.equal(a2, a.2),
          identical(dimnames(a2), list(NULL,NULL,LETTERS[1:4])))

hist(replicate(100, mean(rexp(10))))






