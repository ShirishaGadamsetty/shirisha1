#ERROR HANDLING IN R
#In R, we can handle errors with try() and inherits(object-name,'try-error').

mtry <- try(tuneRF(dt[, -3], dat3[,3], ntreeTry=100, stepFactor=1.5,improve=0.01))
if (!inherits(mtry, "try-error")) {
  best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]
  rf <- randomForest(ID~.,data=dt, mtry=best.m, importance=TRUE, ntree=1000)
} else {
  rf <- randomForest(ID~.,data=dt, importance=TRUE, ntree=1000)
}
