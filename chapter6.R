#Exporting Data in R


# writing in r
mat <- matrix(sample(200,180,replace = T),ncol=3)
mat
df <- data.frame(mat)
df
#1. Writing comma-delimited text file (CSV)
write.csv(mydata,"C:/groups.csv")#worng
write.csv(df,"E:/example_data.csv",sep="\t")
 saveRDS(df, "logistic.rds")
df = readRDS("logistic.rds")
getwd()
#2. Writing tab-delimited text file
write.table(df,"E:/example_data.csv",sep="\t")
#3. Writing Excel File
install.packages("xlsReadWrite")
#Step 2 : Define path and sheet name in the code below
library(xlsReadWrite)
write.xls(mydata, "c:/mydata.xls")
#4. Writing SAS and SPSS File 
install.packages("foreign")

library(foreign)
write.foreign(mydata, "c:/mydata.txt", "c:/manipulate.sps",   package="SPSS")
