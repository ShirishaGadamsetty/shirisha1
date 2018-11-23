#HOW TO INTEGRATE R WITH PHP
#Let's first create a PHP based web form:



#Let's create a sample chart using R code.
x <- rnorm(6,0,1)
png(filename="test.png", width=500, height=500)
hist(x, col="red")
dev.off()

#How to serve concurrent requests?
#sample2.R
args <- commandArgs(TRUE)
cols <- args[1]
fname <- args[2]
x <- rnorm(cols,0,1)
fname = paste(fname, "png", sep = ".")
png(filename=fname, width=500, height=500)
hist(x, col="red") dev.off()

#