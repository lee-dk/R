#문제1_내가 태어난 요일
mybirthday <- as.Date("1993-11-29")
weekday <- format(mybirthday,'%A')
cat("이동규는", weekday,"에 태어났어어요!")

#문제2_내가 태어난 요일
today <- Sys.Date()
year <- format(today,'%Y')
month <- format(today,'%m')
day <- format(today,'%d')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 이고 내가 태어난지 ",today - mybirthday,"되는 날입니다.",sep="")

#문제3_현재시간을 기준으로 년월일시분
t <- Sys.time()
format(t, "%Y년 %m월 %d일 %H시 %M분 %S초")

#문제4_몰라유ㅠ
datetime <- data.frame("12/25/2020 23:59:59", "1/25/2021 23:59:59", "2/25/2021 23:59:59")
names(datetime) <- c("d1", "d2", "d3")
as.POSIXlt(datetime)
datetime[1,]
class(datetime)

#문제5_이건또 뭐얌ㅠㅠ
startdate <- as.Date("2020-06-01")
endtdate <- as.Date("2020-06-07")
startweekday <- format(startdate,'%a')
endweekday <- format(endtdate,'%a')
date <- seq.Date(from=startdate, to=endtdate, by=1)
weekday <- seq(from=startweekday, to=endweekday, by=1)

#문제6
v1 <- c("Happy", "Birthday", "to", "You")
length(v1)
sum(nchar(v1))

#문제7
v2 <- paste(v1, collapse=" ")
length(v2)
sum(nchar(v2))

#문제8
paste(LETTERS[1:10], seq(1,10), sep="")

#문제9
