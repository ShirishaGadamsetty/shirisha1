#HOW TO USE INDEXING OPERATORS IN LIST IN R
dat <- list( str='R', vec=c(1,2,3), bool=TRUE )
a = dat["str"]
class(a)
b = dat[["str"]]
b
class(b)
c = dat$str
class(b)

dat1 <- list(dat,"siri","usha")

#How to extract a list of list
dat[[c("siri","usha")]]
dat1$siri$usha
