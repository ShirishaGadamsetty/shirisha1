#R : CONVERTING A FACTOR TO INTEGER
#Let's create a factor variable
a <- factor(c(2, 4, 3, 3, 4))
str(a)
#Incorrect Way
a1 = as.numeric(a)
str(a1)
#Correct Way
a2 = as.numeric(as.character(a))
str(a2)
