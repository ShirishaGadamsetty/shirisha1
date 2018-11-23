#R WHICH FUNCTION EXPLAINED
ls = data.frame( x1 = ceiling(runif(10)*10),
                 x2 = ceiling(runif(10)*10),
                 x3 = runif(10),
                 x4= rep(letters[1:5],2))
#2. Column number of variable "x4" in ls data set
i=which(names(ls)== "x4")
#names(ls) == "x4"  returns FALSE FALSE FALSE  TRUE. Then WHICH function tells R to calculate the position of TRUE.

#3. Row number in which maximum value of variable "x1" exists
which(ls$x1 == max(ls$x1))
#4. Row number in which multiple conditions hold true
which(ls$x1 == 7 & ls$x2 == 4)

#5. Number of cases in which variable x1 is equal to variable x2
length(which(ls$x1 == ls$x2))
#6. Which value is common in both the variables
ls[which(ls$x1 == ls$x2),"x1"] 

#7. Extract names of all the numeric variables
check = which(sapply(ls, is.numeric))
colnames(ls)[check]
