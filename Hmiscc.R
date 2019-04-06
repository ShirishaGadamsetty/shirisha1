install.packages("Hmisc")
library(Hmisc)
library(missForest)
data("iris")
#seed missing values ( 10% )
iris.mis <- prodNA(iris, noNA = 0.1)

summary(iris.mis)
library(mice)
# impute with mean value
iris.mis$imputed_mean1 <- with(iris.mis, impute(Sepal.Length, mean))

iris.mis$imputed_mean1 
# impute with random value
iris.mis$sl_imputed_random <- with(iris.mis, impute(Sepal.Length, 'random'))



#similarly you can use min, max, median to impute missing value

#using argImpute
impute_arg <- aregImpute(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width +
                             Species, data = iris.mis, n.impute = 5)

impute_arg

#check imputed variable Sepal.Length
mean(impute_arg$imputed$Sepal.Length)



