
#exercise 12
install.packages("data.table") 
#load required library
library(data.table)
#read data
mydata = fread("https://github.com/arunsrinivasan/satrdays-workshop/raw/master/flights_2014.csv")
#describe data
View(mydata)
nrow(mydata)
ncol(mydata)
names(mydata)
head(mydata)
#Selecting or Keeping Columns
dat1 = mydata[ , origin] # returns a vector
dat1
dat1 = mydata[ , .(origin)] # returns a data.table
dat1
dat1 = mydata[, c("origin"), with=FALSE]

dat1
#Keeping a column based on column position
dat2 =mydata[, 2, with=FALSE]
dat2
#keeping Multipul Columns
dat3 = mydata[, .(origin, year, month, hour)]
dat3
#Keeping multiple columns based on column position
dat4 = mydata[, c(2:4), with=FALSE]

dat4

#Dropping a Column
dat5 = mydata[, !c("origin"), with=FALSE]
dat5
#Dropping Multiple Columns
dat6 = mydata[, !c("origin", "year", "month"), with=FALSE]
dat6
#Keeping variables that contain 'dep'
dat7 = mydata[,names(mydata) %like% "dep", with=FALSE]
dat7
#Rename Variables
setnames(mydata, c("dest"), c("Destination"))
setnames(mydata, c("Destination","origin"), c("dest", "origin.of.flight"))
# Filter based on one variable
dat8 = mydata[origin.of.flight == "JFK"]
dat8
#select multiple values
dat9 = mydata[origin.of.flight %in% c("JFK", "LGA")]
dat9
#Apply Logical Operator : NOT
dat11 = mydata[origin.of.flight == "JFK" & carrier == "AA"]
dat11
#Faster Data Manipulation with Indexing
fast<-c(5, 10, 7, 20, 3, 13, 26)
#Set Key
# Indexing (Set Keys)
setkey(mydata, origin.of.flight)
#How to filter when key is turned on.
data12 = mydata[c("JFK", "LGA")]
data12
#Performance Comparison
system.time(mydata[origin.of.flight %in% c("JFK", "LGA")])
system.time(mydata[c("JFK", "LGA")])
#Indexing Multiple Columns
setkey(mydata, origin.of.flight, dest)
#Filtering while setting keys on Multiple Columns
mydata[.("JFK", "MIA")]
#It is equivalent to the following code :
mydata[origin.of.flight == "JFK" & dest == "MIA"]
#To identify the column(s) indexed by
key(mydata)
#Sorting Data
mydata01 = setorder(mydata, origin.of.flight)
#Sorting Data on descending order
mydata02 = setorder(mydata, -origin.of.flight)
mydata02
#Sorting Data based on multiple variables
mydata03 = setorder(mydata, origin.of.flight, -carrier)
mydata03
#Adding Columns (Calculation on rows)
#mydata[, dep_sch:=dep_time - dep_delay]
#Summarize or Aggregate Columns
mydata[, .(mean = mean(arr_delay, na.rm = TRUE),
           median = median(arr_delay, na.rm = TRUE),
           min = min(arr_delay, na.rm = TRUE),
           max = max(arr_delay, na.rm = TRUE))]
#Summarize Multiple Columns
mydata[, .(mean(arr_delay), mean(dep_delay))]
mydata[, lapply(.SD, mean), .SDcols = c("arr_delay", "dep_delay")]
#Summarize all numeric Columns
mydata[, lapply(.SD, mean)]
#Summarize with multiple statistics
mydata[, sapply(.SD, function(x) c(mean=mean(x), median=median(x)))]
#GROUP BY (Within Group Calculation)
#Summarize by group 'origin
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), by = origin.of.flight]
#Use key column in a by operation
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), keyby = origin.of.flight]
#Summarize multiple variables by group 'origin'
mydata[, .(mean(arr_delay, na.rm = TRUE), mean(dep_delay, na.rm = TRUE)), by = origin.of.flight]
#Remove Duplicates
setkey(mydata, "carrier")
unique(mydata)
#Extract values within a group
mydata[, .SD[1:2], by=carrier]
#Select LAST value from a group
mydata[, .SD[.N], by=carrier]
#SQL's RANK OVER PARTITION
dt = mydata[, rank:=frank(-distance,ties.method = "min"), by=carrier]
dt
#Cumulative SUM by GROUP
dat = mydata[, cum:=cumsum(distance), by=carrier]
#Lag and Lead
DT <- data.table(A=1:5)
DT[ , X := shift(A, 1, type="lag")]
DT[ , Y := shift(A, 1, type="lead")]
#Between and LIKE Operator
DT = data.table(x=6:10)
DT[x %between% c(7,9)]
DT = data.table(Name=c("dep_time","dep_delay","arrival"), ID=c(2,3,4))
DT[Name %like% "dep"] 
#Merging / Joins
(dt1 <- data.table(A = letters[rep(1:3, 2)], X = 1:6, key = "A"))
(dt2 <- data.table(A = letters[rep(2:4, 2)], Y = 6:1, key = "A"))
#Inner Join
merge(dt1, dt2, by="A")
#Left Join
merge(dt1, dt2, by="A", all.x = TRUE)
#Right Join
merge(dt1, dt2, by="A", all.y = TRUE)
#Full Join
merge(dt1, dt2, all=TRUE)
#Convert a data.table to data.frame
setDF(mydata)
set.seed(123)
X = data.frame(A=sample(3, 10, TRUE)),
               B=sample(letters[1:3], 10, TRUE)
setDT(X, key = "A")
#Q1. Calculate total number of rows by month and then sort on descending order
mydata[, .N, by = month] [order(-N)]
#Q2. Find top 3 months with high mean arrival delay
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), by = month][order(-mean_arr_delay)][1:3]
#Q3. Find origin of flights having average total delay is greater than 20 minutes
mydata[, lapply(.SD, mean, na.rm = TRUE), .SDcols = c("arr_delay", "dep_delay"), by = origin][(arr_delay + dep_delay) > 20]
#Q4.  Extract average of arrival and departure delays for carrier == 'DL' by 'origin' and 'dest' variables
mydata[carrier == "DL",
       lapply(.SD, mean, na.rm = TRUE),
       by = .(origin, dest),
       .SDcols = c("arr_delay", "dep_delay")]
#Q5. Pull first value of 'air_time' by 'origin' and then sum the returned values when it is greater than 300
mydata[, .SD[1], .SDcols="air_time", by=origin][air_time > 300, sum(air_time)]

               