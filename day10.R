install.packages("rJava")
install.packages("RJDBC")
install.packages("DBI")

library(rJava)
library(RJDBC)
library(DBI)

getwd()
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", "mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')

query <- "select * from goods"
goodsAll <- dbGetQuery(conn, query)
goodsAll
dbReadTable(conn, 'goods')

query <- "select * from goods where su >= 3"
dbGetQuery(conn, query)

query <- "SELECT * FROM goods order by dan desc"
dbGetQuery(conn, query)

insert.df <- data.frame(code = 5, name = '식기세척기', su = 1, dan = 250000)
#dbWriteTable(conn, 'goods', insert.df)
dbWriteTable(conn, 'goods1', insert.df)

query <- "select * from goods1"
goodsAll <- dbGetQuery(conn, query)
goodsAll







dbWriteTable(conn,"book",data.frame(bookname=c("파이썬 정복","하둡 완벽 입문","R 프로그래밍"),
                                    price=c(25000,25000,28000)))
dbGetQuery(conn, "SELECT * FROM book")


dbWriteTable(conn, "mtcars", mtcars[1:5, ])
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[6:10, ], append = TRUE)
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[1:2, ], overwrite = TRUE)
dbReadTable(conn, "mtcars")



dbWriteTable(conn,"cars",head(cars,3))
dbGetQuery(conn, "SELECT * FROM cars")


# 데이터 수정
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(1,1)")
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(2,2)")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*100 WHERE SPEED =1")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*3 WHERE SPEED =1")
dbReadTable(conn,"cars")

# 테이블 삭제
dbRemoveTable(conn,"cars")


# 데이터 전처리(1) - apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df

apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(1:6, gender, sum, na.rm=TRUE)
tapply(df$w, gender, mean, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])


v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d))
sapply(flower, function(d) if(nchar(d) > 5) d)
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA))
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
