# save data in r session
saveRDS(mydata, "logistic.rds")
# read data in r session
mydata = readRDS("logistic.rds")
mydata
View(logistic.rds)
#Another way : Saving data file in R session
save (mydata,file="E:\\logistic.rdata")
#Loading stored data from R session
load("E:\\logistic.rdata", ex <- new.env())
ls(ex)
#Saving multiple objects in R session
save(mydata, data2, file="1.RData")
#Saving everything in R session
save.image(file="1.RData")
View(logistic)
#exercise 8 end