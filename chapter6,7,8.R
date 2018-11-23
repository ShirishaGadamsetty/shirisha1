# writing in r
mat <- matrix(sample(200,180,replace = T),ncol=3)
mat
write.csv(mydata,"C:/groups.csv")# wrong
df <- data.frame(mat)
df
write.csv(df,"E:/example_data.csv",sep="\t")
 saveRDS(df, "logistic.rds")
df = readRDS("logistic.rds")
getwd()
write.table(df,"E:/example_data.csv",sep="\t")

install.packages("xlsReadWrite")
install.packages("foreign")
#
data = read.table(text="
X Y Z
                  6 5 0
                  6 3 NA
                  6 1 5
                  8 5 3", header=TRUE)
 

# save data in r session
saveRDS(mydata, "logistic.rds")
# read data in r session
mydata = readRDS("logistic.rds")
mydata
View(logistic.rds)
save (mydata,file="E:\\logistic.rdata")
load("E:\\logistic.rdata", ex <- new.env())
ls(ex)
save(mydata, data2, file="1.RData")
save.image(file="1.RData")
View(logistic)
#exercise 8 end