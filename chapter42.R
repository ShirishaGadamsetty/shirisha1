#CARET PACKAGE IMPLEMENTATION IN R

#Loading required libraries
install.packages("c50")
library(C50)
install.packages("RORC")

library(ROCR)
library(caret)
library(plyr)

#Set Parallel Processing - Decrease computation time
install.packages("doMC")
library(doMC)
registerDoMC(cores = 5)

#Splitting data into training and validation
trainIndex <- createDataPartition(data[,1], p = .6, list = FALSE, times = 1)
dev <- data[ trainIndex,]
val  <- data[-trainIndex,]

#Repeated K Fold Cross-Validation
cvCtrl <- trainControl(method = "repeatedcv", number =10, repeats =3, classProbs = TRUE)


#Example 1 : train with tuneGrid (Manual Grid)
grid <- expand.grid(.model = "tree", .trials = c(1:100), .winnow = FALSE)

set.seed(825)
tuned <- train(dev[, -1], dev[,1], method = "C5.0", metric = "ROC",
               tuneGrid = grid, trControl = cvCtrl)

#Example 2 : train with tunelength (Automatic Grid)
set.seed(825)
tuned <- train(dev[, -1], dev[,1], method = "C5.0", metric = "ROC",
               tunelength = 10, trControl = cvCtrl)


#Calculating the Variable Importance
varImp(tuned$finalModel , scale=FALSE)
plot(varImp(tuned$finalModel))

RocImp <- filterVarImp(x = dev[, -1], y = dev[,1])
RocImp

# Seeing result
tuned

# Seeing Parameter Tuning
trellis.par.set(caretTheme())
plot(tuned, metric = "ROC")

# Seeing final model result
print(tuned$finalModel)

#Summaries of C5.0 Model
summary(tuned$finalModel)

# variable Importance
C5imp(tuned$finalModel, metric="usage")

#Scoring
val1 = predict(tuned$finalModel, val[, -1], type = "prob")





