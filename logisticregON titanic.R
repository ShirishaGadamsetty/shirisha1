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


index <- sample(1:nrow)
