#MEASURING RUNNING TIME OF R CODE

start.time <- Sys.time()

install.packages("devtools")
library(devtools)
#Selecting Optimum MTRY parameter
mtry <- tuneRF(dev[, -1], dev[,1], ntreeTry=500, stepFactor=1.5,improve=0.05, trace=TRUE, plot=TRUE)
best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]

#Train Random Forest
rf <-randomForest(classe~.,data=dat3, mtry=best.m, importance=TRUE,ntree=50)

end.time <- Sys.time()
time.taken <- round(end.time - start.time,2)
time.taken