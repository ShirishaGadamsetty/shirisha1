#TRANSPOSE DATA IN R
#sample data
data <- read.table(text="X Y    Z
                   ID12   2012-06    566
                   ID1    2012-06  10239
                   ID6    2012-06    524
                   ID12   2012-07   2360
                   ID1    2012-07   13853
                   ID6    2012-07    2352
                   ID12   2012-08   3950
                   ID1    2012-08   14738
                   ID6    2012-08   4104",header=TRUE)
#Install reshape2 package if not installed already
if (!require(reshape2)){
  install.packages("reshape2")
  library(reshape2)
}
#R Code : Transform Long to Wide Format
library(reshape2)
xx=dcast(data, Year + SemiYear ~ Product,  value.var = "Income")


install.packages("reshape2")
mydata = read.table(text= "ID setosa versicolor virginica
                    1 5.1 NA NA
                    2 4.9 NA NA
                    3 NA 7 NA
                    4 NA 6.4 NA
                    5 NA NA 6.3
                    6 NA NA 5.8
                    ", header=TRUE)
library(reshape2)
x = colnames(mydata[,-1])
t = melt(mydata,id.vars = "ID",measure.vars = x , variable.name="Species", value.name="Sepal.Length",na.rm = TRUE)
#Example 2 : More than 1 ID Variable
mydata = read.table(text= "Year Semiyear Product  Income                    
                            1     1      productA  13324
                            1     2      productA  14245
                            1     1      productB  12456
                            1     2      productB  34267
                            2     1      productA  16754
                            2     2      productA  267854
                            2     1      productB  213456
                            2     2      productB  43256
                                        ", header=TRUE)



library(reshape2)
xx=dcast(mydata, Year + Semiyear ~ Product,  value.var = "Income")
xx
dcast(mydata, Year ~ Product, value.var = "Income")
dcast(data)
acast(data)
dcast(mydata, Year ~ Product, fun.aggregate = sum, value.var = "Income")
#Convert Wide Format Data to Long Format
mydata = read.table(text= "ID setosa versicolor virginica
                    1 5.1 NA NA
                    2 4.9 NA NA
                    3 NA 7 NA
                    4 NA 6.4 NA
                    5 NA NA 6.3
                    6 NA NA 5.8
                    ", header=TRUE)
#The following program would reshape data from wide to long format. 
library(reshape2)
x = colnames(mydata[,-1])
t = melt(mydata,id.vars = "ID",measure.vars = x , variable.name="Species", value.name="Sepal.Length",na.rm = TRUE)
t
