#RUN SQL QUERIES IN R
#Install and Load Package
install.packages("sqldf")
library(sqldf)

#Create sample data
dt <- data.frame( ID = c('X1','X2','X4','X2','X1','X4','X3','X2','X1','X3'),
                  Value = c(4,3,1,3,4,6,6,1,8,4))

#Example 1 : Select first 3 rows
x = sqldf("select * from dt limit 3")


#Example 2 : Handle dot (.) in Column and Table names 
#Put the names in double quotes
test <- data.frame( x.1 = 1:10 )
sqldf( 'SELECT "x.1" FROM test' )

test.2 = data.frame(x= sample(10))
sqldf( 'SELECT * FROM "test.2" ' )

#Example 3 : Subset rows 
x2 = sqldf("select * from dt where Value >= 4")

#Example 4 : Concatenate two data frames 
x3 = sqldf("select * from x union all select * from x2")


#Example 5 : Create a new variable
x4 = sqldf("select *, value*2 as newval from dt ")

#Example 6 : Merge with another table
dt2 <- data.frame( ID = c('A1','A2','A4','A2','A1','A4','A3','A2','A1','A3'),

                   ColID = c('Saving',
                             'Current',
                             'Loan',
                             'Current',
                             'Saving',
                             'Loan',
                             'Mortgage',
                             'Current',
                             'Saving',
                             'Mortgage')) 

x5 = sqldf("select a.*,b.ColID from dt a left join (select distinct ID, ColID from  dt2) b
           on a.ID = b.ID")

#Example 7 : Working with Dates
install.packages("RH2")
library(RH2)

start.time <- Sys.time()

test1 <- data.frame(sale_date = as.Date(c("2008-08-01", "2031-01-09","1990-01-03")))
as.numeric(test1[[1]])
sqldf("select MAX(sale_date) from test1")

end.time <- Sys.time()
time.taken <- round(end.time - start.time,2)
time.taken

#Example 8 : Cumulative Sum
install.packages("RPostgreSQL")
library(RPostgreSQL)
# Upper case is folded to lower case by default so surround ID with double quotes
x6 = sqldf("select *, sum(Value) over (partition by "ID" order by Value) colsum from dt ") 

#Example 9 : Ranking within Group
# Upper case is folded to lower case by default so surround ID with double quotes
x7 = sqldf("select *,  rank() over (partition by "ID" order by Value) rank from dt")
dt
                   