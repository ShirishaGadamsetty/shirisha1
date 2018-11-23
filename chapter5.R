#Importing Data in R

#BIG CSV Files should be imported with fread function of data.table.
library(data.table)
mydata = fread("c:/groups.csv")
#1. Reading a comma-delimited text file (CSV)

mydata <- read.csv("c:/groups.csv", header=TRUE)
#If you want to set any value to a missing value
mydata1 <- read.csv("c:/groups.csv", header=TRUE, na.strings=".")
mydata1
#If you want to set multiple values to missing values
mydata2 <- read.csv("c:/groups.csv", header=TRUE, na.strings=  c("A" , "B" ))
mydata2     
#2. Reading a tab-delimited text file
mydata3<- read.table("c:/groupstab.txt",sep = "\t",stringsAsFactors = F)
# If you have the names (headers) in the first row
mydata <- read.table("c:/groupstab.txt",sep = "\t", header=TRUE)
#If you want to set any value to a missing value
mydata <- read.table("c:/groupstab.txt", header=TRUE,sep = "\t", na.strings=".")

#3. Reading Excel File
read_excel("groupsxls.xls")                    
loadhistory("~/groupsxls.xltx")
excel_format("c:/groupsxls", guess = TRUE)
format_from_ext("c:/groupsxls.xltx")
files <- c(
  "a.xlsx",
  "b.xls",
  "c.png",
  file.path(R.home("doc"), "html", "logo.jpg"),
  readxl_example("clippy.xlsx"),
  readxl_example("deaths.xls")
)
excel_format(files)

read_excel("c:/groupsxls.xls", sheet = NULL,guess_max = min(1000,n_max))   

library(foreign)
write.foreign(data, "c:/groupstab.txt", "c:/mydata.sas",   package="SAS")



#4. Reading SAS File
install.packages("haven")
#Step 2 : Define path in the code below
library("haven")
read_sas("c:/mydata.sas7bdat")



#5. Reading SPSS File
read_spss("c:/mydata.sav")


#6. Load Data from R
load("mydata.RData")
