#문제1


# 기본 시각화 실습
drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver', 'mariadb-java-client-2.6.2.jar')
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')
library(showtext)
showtext_auto()
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

data1 <- dbReadTable(conn, 'productlog')
(data2 <- table(data1$pid))

# 문제 1
png(filename="clicklog1.png", height=400, width=700, bg="white")
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(data2, col=terrain.colors(10), main="세로바 그래프 실습", ylab="클릭수",
        xlab="상품ID", ylim=c(0,100))
dev.off()

# 문제 2
data3 <- data1$clicktime
data3_hour <- substr(data3, 9, 10)
table_data3 <- table(data3_hour)
length(table_data3)


names(table_data3)

piename <- paste(as.integer(names(table_data3)), "~",as.integer(names(table_data3)) +1, sep='')
names(table_data3) <- piename
pie(table_data3, main="파이그래프 실습", col=rainbow(17))

dev.copy(png, "clicklog2.png")
dev.off()

str(data1)
clicktime <- as.POSIXlt(as.character(data1$clicktime),format="%Y%m%d%H%M")
clickhour <- format(clicktime, "%H")
table_data3 <- table(data3_hour)
names(table_data3)
piename <- paste(as.integer(names(table_data3)), "~",as.integer(names(table_data3)) +1, sep='')
names(table_data3) <- piename
pie(table_data3, main="파이그래프 실습", col=rainbow(17))

# 문제3

# 1.테이터 정리

record <- read.table("data/성적.txt", header=TRUE)
sub.record <- record[,3:5]

# 2.차트 그리기
boxplot(sub.record, col=rainbow(3), axes=F)
axis(1, at=1:3, lab=names(sub.record), family="maple")
axis(2, at=seq(2, 10, 2), family="maple")
title("과목별 성적 분포", family="maple", cex.main=1.5, col.main="orange")
box()

# 3.이미지저장
dev.copy(png, 'clicklog3.png')
dev.off()