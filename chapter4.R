
#Method 1 : Enter Data Manually
df1 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  var1 = c('a', 'b', 'c', 'd', 'e'),
                  var2 = c(1, 1, 0, 0, 1))

#Method 2 : Sequence of numbers, letters, months and random numbers
df2 <- data.frame(a = seq(1,16,by=2), b = LETTERS[1:8], x= month.abb[1:8], y = sample(10:20,8, replace = TRUE), z=letters[1:8])
#Method 3 : Create numeric grouping variable
df3 = data.frame(X = sample(1:3, 15, replace = TRUE))
df3
#Method 4 : Random Numbers with mean 0 and std. dev 1
set.seed(1)
df4 <- data.frame(Y = rnorm(15), Z = ceiling(rnorm(15)))
#Method 5 : Create binary variable (0/1)
set.seed(1)
ifelse(sign(rnorm(15))==-1,0,1)

#Create character grouping variable
mydata = sample(LETTERS[1:5],16,replace = TRUE)
