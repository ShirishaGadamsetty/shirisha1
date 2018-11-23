#R : DELETING COLUMNS WHERE CERTAIN % OF MISSING VALUES

final <- test[, colMeans(is.na(test)) <= .5]

#Note : test is a data frame 
