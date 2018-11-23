#Replacing / Recoding values
data1 = data.frame(Groupcode = ifelse(sign(rnorm(25))==-1,' HS Teachers','MS Teachers'), Q1= sample(1:25))
data1
mydata$Q1[mydata$Q1==1] <- 6
data1$Groupcode = as.character(data1$Groupcode)
data1$Groupcode[data1$Groupcode =='HS Teachers  '] <- 'ES Teachers'
data1
mydata[mydata == 2 | mydata == 3] <- NA
mydata
# Install the car package
install.packages("car")
# Load the car package
library("car")
# Recode 1 to 6
mydata$Q1 <- recode(mydata$Q1, "1=6")
# Recoding 1 through 4 to 0 and 5 and 6 to 1
mydata$Q1 <- recode(mydata$Q1, "1:4=0; 5:6=1")
# Recoding lowest value through 4 to 0 and 5 to highest value to 1
mydata$Q1 <- recode(mydata$Q1, "lo:4=0; 5:hi=1")
# Recoding lowest value through 4 to 0, 5 and 6 to 1, remaining values to 3,
mydata$Q1 <- recode(mydata$Q1, "lo:4=0; 5:6=1;else = 3")
# Create a new column called Ques1
mydata$Ques1<- recode(mydata$Q1, "1:4=0; 5:6=1")
samples = data.frame(x =c(rep(1:10)), y=letters[1:10])
samples$t1 = ifelse(samples$x>6,2,1)
samples$t3 = ifelse(samples$x>1 & samples$y=="b" ,2,1)
samples$t4 = ifelse(samples$x>=1 & samples$x<=4,1,ifelse(samples$x>=5 & samples$x<=7,2,3))
# Install the plyr package
install.packages("dplyr")
# Load the plyr package
library(dplyr)
# Rename Q1 variable to var1
mydata <- rename(mydata, var1 = Q1)
mydata1 <- mydata[1:2]
mydata1 <- mydata[c(1,2:3)] 
mydata
newdata <- mydata[c("State" ,"var1" ,"Ques1")]
mydata [-5] 
mydata$Q3 <- NULL
mydata [-(3:4) ] 
df = subset(mydata, select = -c(x,z) )
df
#Create Sample Data
mydata = data.frame(Name = ifelse(sign(rnorm(25))==-1,'ABC','DEF'), age = sample(1:25))
newdata <- mydata[1:10,]
mydata<-subset(mydata, age==3)
newdata<-subset(mydata, age==3)
newdata<-subset(mydata, Name=="ABC" & age==3)
newdata<-subset(mydata, Name=="ABC" | age==3)
newdata<-subset(mydata, age>=3)
newdata<-subset(mydata, is.na(age))
newdata<-subset(mydata, !is.na(age))
newdata<-subset(mydata, !is.na(age))

#sorting vector
x= sample(1:50)
x = sort(x, decreasing = TRUE)
#Sorting a data frame
mydata = data.frame(Gender = ifelse(sign(rnorm(25))==-1,'F','M'), SAT= sample(1:25))
mydata.sorted <- mydata[order(mydata$Gender),]
mydata.sorted1 <- mydata[order(mydata$Gender, -mydata$SAT),]


#value labeling
mydata$Gender <- factor(mydata$Gender, levels = c(1,2), labels = c("male", "female"))
mydata$var2 <- ordered(mydata$var2, levels = c(1,2,3,4), labels = c("Strongly agree", "Somewhat agree", "Somewhat disagree", "Strongly disagree"))
mydata$Gender <- ordered(mydata$Gender, levels = c(1,2), labels = c("male", "female"))
gender

#Dealing with missing data
colSums(is.na(mydata))
rowSums(is.na(mydata))
mydata[!complete.cases(mydata),]
mydata1 <- na.omit(mydata)
mydata[mydata$Q1==999,"Q1"] <- NA 


#Aggregate by groups
samples = data.frame(x =c(rep(1:10)), y=round((rnorm(10))))
mydata <- aggregate(x~y, samples, mean, na.rm = TRUE)

data1 < - read.csv(file.choose(),header = TRUE)
data1

mydata <- merge(mydata1, mydata2, by=c("GroupCategoryID"))
mydata1
mydata2
#Removing Duplicates
data = read.table(text="
                  X Y Z
                  6 5 0
                  6 5 0
                  6 1 5
                  8 5 3
                  1 NA 1
                  8 7 2
                  2 0 2", header=TRUE)
mydata1 <- unique(data)
mydata2 <- subset(data, !duplicated(data[,"Y"]))
mydata1
mydata2

#Combining Columns and Rows 
A <- c(1,2,3,4)
B <- c(3,4,5,6)
newdata1<- cbind(A, B)
newdata1<- rbind(A, B)


install.packages("gtools") #If not installed
library(gtools)
mydata <- smartbind(mydata1, mydata2)
mydata
#exercise 10 end