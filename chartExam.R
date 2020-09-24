
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", "mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')

library(showtext)
library(showtext)
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


data1 <- dbReadTable(conn, "productlog")
(data2 <- table(data1$pid))

#문제1
png(filename = "clicklog1.png", height = 400, width = 700, bg="white")
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(data2, col=te.color(10))



#문제2
data3 <- data1$clicktime
data3_hour <- substr(data3, 9, 10)
table_data3 <- table(data3_hour)

names(table_data3)

piename <- paste()