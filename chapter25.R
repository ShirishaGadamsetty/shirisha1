#SPLIT A DATA FRAME
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
#Split a data frame
mydt2 = split(data, data$Y)
mydt2
#Get first list element
mydt2[[3]]
#Calculate mean on each list element
sapply(mydt2 , function(x) mean(x$Z))
#Split a list into multiple data frames
for(i in 1:length(mydt2)) {
  assign(paste0("t.", i), mydt2[[i]])
}
