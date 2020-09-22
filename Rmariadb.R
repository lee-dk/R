#1
head(iris)
str(iris)

#2
names(iris) <- c("slength", "swidth", "plength", "pwidth", "species")

library(rJava)
library(RJDBC)
library(DBI)
getwd()
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", "mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')

#3
insert.df <- data.frame(iris)
dbWriteTable(conn, 'iris', insert.df)

#4
query <- "select * from iris"
iris_all <- dbGetQuery(conn, query); iris_all

#5
query <- "select * from iris where species = 'setosa'"
iris_setosa <- dbGetQuery(conn, query); iris_setosa

#6
query <- "select * from iris where species = 'versicolor'"
iris_versicolor <- dbGetQuery(conn, query); iris_versicolor

#7
query <- "select * from iris where species = 'virginica'"
iris_virginica <- dbGetQuery(conn, query); iris_virginica

#8
productdf <- read.table("data/product_click.log" )

#9
names(productdf) <- c("clicktime", "pid")

#10
dbWriteTable(conn, 'productlog', insert.df)
query <- "select * from productlog"
dbGetQuery(conn, query)

#11
query <- "select * from productlog where pid = 'p003'"
p003 <- dbGetQuery(conn, query); p003

#12
emp <- read.csv("data/emp.csv")

#13
dbWriteTable(conn, "emp", emp)

#14
query <- "SELECT * FROM emp order by sal desc"
result1 <- dbGetQuery(conn, query); result1

#15
query <- "SELECT * FROM emp order by hiredate"
result2 <- dbGetQuery(conn, query); result2

#16
query <- "SELECT * FROM emp where sal >= 2000"
result3 <- dbGetQuery(conn, query); result3

#17
query <- "SELECT * FROM emp where sal >= 2000 and sal < 3000"
result4 <- dbGetQuery(conn, query); result4
