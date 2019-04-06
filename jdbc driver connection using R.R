Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_191")
library(rJava)
require(RJDBC)
library(RJDBC)
drv <- JDBC("com.mysql.jdbc.Driver",
            "D:/J2EE - Copy/mysql.jar",
            identifier.quote="`")
conn <- dbConnect(drv, "jdbc:mysql://localhost/seja5", "root", "sreesai")

dbListTables(conn)
data(iris)
dbWriteTable(conn, "iris", iris, overwrite=TRUE)
dbGetQuery(conn, "select count(*) from iris")
dbReadTable(conn, "select * from iris")
dbGetQuery(conn, "select count(*) from iris where Species=?", "setosa")

