#CARET PACKAGE : TRAIN MODELS
#Method Functions in trainControl Parameter

#1. Specifies a parameter grid for fine tuning GBM model
grid <- expand.grid( .n.trees=seq(10,50,10), .interaction.depth=seq(1,4,1), .shrinkage=c(0.01,0.001), .n.minobsinnode=seq(5,20,5)) 


#2. 10 fold Cross Validation
train_control <- trainControl(method = 'cv', number =10, classProbs = TRUE)

#3. Train GBM Model
fit <- train(x,y,method="gbm",metric="roc", trControl=train_control, tuneGrid=grid) 

#Selecting the Least Complex Model
#Step I : Train your model
set.seed(825)
gbmFit3 <- train(Class ~ ., data = training, method = "gbm", trControl = fitControl, verbose = FALSE, tuneGrid = gbmGrid, metric = "ROC")

#Step II : Tolerance function 
whichTwoPct <- tolerance(gbmFit3$results, metric = "ROC", tol = 2, maximize = TRUE)
cat("best model within 2 pct of best:\n")
gbmFit3$results[whichTwoPct,1:6]



