titanic <- read.csv("c:/train.csv", header = TRUE)
View(titanic)
dim(titanic)

head(titanic)

table(titanic$survived)

titanic$sex <- factor(titanic$sex)
titanic$cabin <- factor(titanic$cabin)
titanic$embarked <- factor(titanic$embarked)


is.factor(titanic$sex)

summary(titanic)


titanic <- titanic[-c(4,9,11)]



#creating traing and testing sample
#60% in traing data and 40% in test data

passengerId <- train&passengerId
index <- sample(1:nrow(titanic),size = 0.6*nrow(titanic))
index
 train <- titanic[index]
 test1 <- titanic[-index]

 head(titanic) 
head(train)
 
 #model building
 model <- glm(survived ~ .,family = binomial(link = logit),data=titanic)

 #model summary
 summary(model)
 train<- read.csv("c:/train.csv", header = TRUE)
 test.survived <- data.frame(survived = rep("None", nrow(test)), test[,])
 #scoring test data
 prob <- predict(model,train,type = "response")
head(prob)
 #confusion matrix and accuracy
pred <- rep(0,nrow(train))
pred[prob> .5] =1
table(pred,train$survived)



 