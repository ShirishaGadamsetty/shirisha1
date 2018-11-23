#R : EXTRACTING NUMERIC AND FACTOR VARIABLES
#Extracting Numeric Variables

cols <- sapply(mydata, is.numeric)
abc = mydata [,cols]

#Extracting Factor Variables
cols <- sapply(mydata, is.factor)
abc = mydata [,cols]