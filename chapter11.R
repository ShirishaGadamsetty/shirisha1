 mydata1 = read.csv("E:/sampledata.csv")
#Example 1 : Selecting Random N Rows
sample_n(mydata,3)
#Example 2 : Selecting Random Fraction of Rows
sample_frac(mydata,0.1)
install.packages("dplyr")
library(dplyr)
#Example 3 : Remove Duplicate Rows based on all the variables (Complete Row)
x1 = distinct(mydata)
x1
mydata1
#Example 4 : Remove Duplicate Rows based on a variable
x2 = distinct(mydata1, Index, .keep_all= TRUE)
x2
#Remove Duplicates Rows based on multiple variables
x2 = distinct(mydata1, Index, Y2010, .keep_all= TRUE)
#Example 6 : Selecting Variables (or Columns)
mydata2 = select(mydata1, Index, State:Y2008)
mydata2
#Example 7 : Dropping Variables
mydata = select(mydata, -Index, -State)
mydata = select(mydata, -c(Y2008,State))
#Example 8 : Selecting or Dropping Variables starts with 'Y'
mydata3 = select(mydata1, starts_with("Y"))
mydata33 = select(mydata1, -starts_with("Y"))
mydata33
mydata1 = read.csv("E:/sampledata.csv")
mydata1
#Example 9 : Selecting Variables contain 'I' in their names
mydata4 = select(mydata1, contains("I"))
mydata4
#Example 10 : Reorder Variables
mydata5 = select(mydata1, State, everything())
mydata5
#Example 11 : Rename Variables
mydata6 = rename(mydata5,  YY2009=Y2009)
mydata6
#Example 13 : Multiple Selection Criteria
mydata7 = filter(mydata6, Index %in% c("A", "C"))
mydata7
#Example 14 : 'AND' Condition in Selection Criteria
mydata8 = filter(mydata6, Index %in% c("A", "C") & Y2002 >= 1300000 )
mydata8
#Example 15 : 'OR' Condition in Selection Criteria
mydata9 = filter(mydata6, Index %in% c("A", "C") | Y2002 >= 1300000)
mydata9
#Example 16 : NOT Condition
mydata10 = filter(mydata6, !Index %in% c("A", "C"))
#Example 17 : CONTAINS Condition
mydata10 = filter(mydata6, grepl("Ar", State))
mydata10
#Example 18 : Summarize selected variables
summarise(mydata9, Y2010_mean = mean(Y2010), Y2010_med=median(Y2010))
#Example 19 : Summarize Multiple Variables
summarise_at(mydata9, vars(Y2006, Y2007), funs(n(), mean, median))
#Example 20 : Summarize with Custom Functions
#summarise_at(mydata, vars(Y2011, Y2012)
#mydata  


#How to apply Non-Standard Functions
set.seed(222)
mydata <- data.frame(X1=sample(1:100,100), X2=runif(100))
summarise_at(mydata,vars( Y2002, Y2003), function(Y2004) var(Y2004 - mean(Y2004)))

set.seed(222)
mydata <- data.frame(X1=sample(1:100,100), X2=runif(100))
summarise_at(mydata,vars(X1,X2), function(x) var(x - mean(x)))
#Summarize all Numeric Variables
summarise_if(mydata, is.numeric, funs(n(),mean,median))
mydata
numdata = mydata[sapply(mydata,is.numeric)]
numdata
sumarise(mydata,mean(setosa,na.rm =T) ,median( versicolor,na.rm = T))

summarise_all(numdata, funs(n(),mean(X1),median(X2)))
numdata
arrange(numdata, X1, X2)
mydata
View(mydata)
mydata %>%
  group_by(X1) %>%
  summarise(avg= mean(X2),na.rm=T)
mydata
#Pipe Operator %>%
#filter(data_frame, variable == value)
#data_frame %>% filter(variable == value)

numdata
dt = sample_n(select(mydata1, Index, State),10)
mydata <- read.csv("E:/sampledata.csv")
dt = mydata %>% select(Y2002, Y2003) %>% sample_n(10)View(mydata)
#group_by() function :
group_by(data, variables)
data %>% group_by(variables)
#Example 24 : Summarise Data by Categorical Variable
t = summarise_at(group_by(mydata1, Index), vars(Y2011, Y2012), funs(n(), mean(., na.rm = TRUE)))
t
t = mydata %>% group_by(Index) %>%
  summarise_at(vars(Y2011:Y2015), funs(n(), mean(., na.rm = TRUE)))
#do() function :
#do(data_frame, expressions_to_apply_to_each_group)
#Example 25 : Filter Data within a Categorical Variable
t = mydata %>% filter(Index %in% c("A", "C","I")) %>% group_by(Index) %>%
  do(head( . , 2))
#Example 26 : Selecting 3rd Maximum Value by Categorical Variable
t = mydata1 %>% select(Index, Y2015) %>%
  filter(Index %in% c("A", "C","I")) %>%
  group_by(Index) %>%
  do(arrange(.,desc(Y2015))) %>%  slice(3)
#Using Window Functions
t = mydata1 %>% select(Index, Y2015) %>%
  filter(Index %in% c("A", "C","I")) %>%
  group_by(Index) %>%
  filter(min_rank(desc(Y2015)) == 3)
#Example 27 : Summarize, Group and Sort Together 
t = mydata1 %>%
  group_by(Index)%>%
  summarise(Mean_2014 = mean(Y2014, na.rm=TRUE),
            Mean_2015 = mean(Y2015, na.rm=TRUE)) %>%
  arrange(desc(Mean_2015))
#mutate() function :
#Example 28 : Create a new variable
mydata2 = mutate(mydata1, change=Y2015/Y2014)
#Example 29 : Multiply all the variables by 1000
mydata11 = mutate_all(mydata, funs("new" = .* 100))
#Example 30 : Calculate Rank for Variables
mydata12 = mutate_at(mydata1, vars(Y2008:Y2010), funs(Rank=min_rank(.)))
myata13 = mutate_at(mydata1, vars(Y2008:Y2010), funs(Rank=min_rank(desc(.))))
#Example 31 : Select State that generated highest income among the variable 'Index'
out = mydata1 %>% group_by(Index) %>% filter(min_rank(desc(Y2015)) == 1) %>%
  select(Index, State, Y2015)
#Example 32 : Cumulative Income of 'Index' variable
out2 = mydata1 %>% group_by(Index) %>% mutate(Total=cumsum(Y2015)) %>%
  select(Index, Y2015, Total)
out2
#join() function :
df1 = data.frame(ID = c(1, 2, 3, 4, 5),
                 w = c('a', 'b', 'c', 'd', 'e'),
                 x = c(1, 1, 0, 0, 1),
                 y=rnorm(5),
                 z=letters[1:5])

df2 = data.frame(ID = c(1, 7, 3, 6, 8),
                 a = c('z', 'b', 'k', 'd', 'l'),
                 b = c(1, 2, 3, 0, 4),
                 c =rnorm(5),
                 d =letters[2:6])

df3 = inner_join(df1, df2, by = "ID")
inner_join(df1, df2, by = c("ID"="ID"))
df1
df2
#Example 34 : Applying LEFT JOIN
left_join(df1, df2, by = "ID")
#Example 35 : Applying INTERSECT
mtcars$model <- rownames(mtcars)
first <- mtcars[1:20, ]
second <- mtcars[10:32, ]
intersect(first, second)
second
#Example 36 : Applying UNION
x=data.frame(ID = 1:6, ID1= 1:6)
y=data.frame(ID = 1:6,  ID1 = 1:6)
union(x,y)
union_all(x,y)
#Example 37 : Rows appear in one table but not in other table
setdiff(first, second)
#Example 38 : IF ELSE Statement
#if_else(condition, true, false, missing = NULL)
df <- c(-10,2, NA)
if_else(df < 0, "negative", "positive", missing = "missing value")
#Create a new variable with IF_ELSE
df =data.frame(x = c(1,5,6,NA))
df %>% mutate(newvar=if_else(x<5, x+1, x+2,0))
#Nested IF ELSE
mydf =data.frame(x = c(1:5,NA))
mydf %>% mutate(newvar= if_else(is.na(x),"I am missing",
                                if_else(x==1,"I am one",
                                        if_else(x==2,"I am two",
                                                if_else(x==3,"I am three","Others")))))
#Example 39 :  Apply ROW WISE Operation 
df = mydata1 %>%
  rowwise() %>% mutate(Min= min(Y2012,Y2013,Y2014,Y2015)) %>%
  select(Y2012:Y2015,Min)
#Example 40 : Combine Data Frames
df1=data.frame(ID = 1:6,  x=letters[1:6])
df2=data.frame(ID = 7:12, x=letters[7:12])
df1
df2
xy = bind_rows(df1,df2)
xy = bind_cols(x,y)
#Example 41 : Calculate Percentile Values
mydata1 %>% group_by(Index) %>%
  summarise(Pecentile_25=quantile(Y2015, probs=0.25),
            Pecentile_50=quantile(Y2015, probs=0.5),
            Pecentile_75=quantile(Y2015, probs=0.75),
            Pecentile_99=quantile(Y2015, probs=0.99))
x= data.frame(N= 1:10)
x = mutate(x, pos = ntile(x$N,5))
#Example 42 : Automate Model Building
length(unique(mtcars$cyl))
by_cyl <- group_by(mtcars, cyl)
models <- by_cyl %>% do(mod = lm(mpg ~ disp, data = .))
summarise(models, rsq = summary(mod)$r.squared)
models %>% do(data.frame(
  var = names(coef(.$mod)),
  coef(summary(.$mod)))
)

#if() Family of Functions
mydata2 = select_if(mydata1, is.numeric)
mydata3 = select_if(mydata1, is.factor)
#Example 44 : Number of levels in factor variables
summarise_if(mydata1, is.factor, funs(nlevels(.)))
#Example 45 : Multiply by 1000 to numeric variables
mydata11 = mutate_if(mydata1, is.numeric, funs("new" = .* 1000))
#Example 46 : Convert value to NA
k <- c("a", "b", "", "d")
na_if(k, "")
