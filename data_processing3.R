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

#문제4
datetime <- data.frame("2020/12/25 23:59:59", "2021/1/25 23:59:59", "2021/2/25 23:59:59")
date1 <- c()
for(i in 1:3){
  POSIXlt_datetime <- as.POSIXlt(datetime[,i])
  date1 <- append(date1, POSIXlt_datetime)
}
date1
class(date1)

#문제5
startdate <- as.Date("2020-06-01")
endtdate <- as.Date("2020-06-07")
date <- seq(startdate, endtdate, 1)
format(date, "%a-%m%d")

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
text <- "Good Morning"
text1 <- unlist(strsplit(x= text, split= " "))
list(text1[1], text1[2])

#문제10
text3 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
           "That's why we call it the present – from kung fu Panda")
text4 <- unlist(strsplit(x= text3, split= " "))
text5 <- text4[-19]
gsub(",","", text5)

#문제11
ssn <- c("941215-1234567", "850605-2345678", "760830-1357913")
ssn1 <- unlist(strsplit(x= ssn, split= "-"))
ssn2 <- c()
for(n in 1:6){
  if(nchar(ssn1[n]) == 7){
    ssn1[n] <- gsub("[0-9]","*", ssn1[n])
    ssn2 <- append(ssn2, ssn1[n])
  }
}
ssn3 <- ssn1[-c(2,4,6)]
ssn <- paste(ssn3,ssn2,sep = "-"); ssn

#문제12
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
#12-1[한글 삭제]
r1 <- gsub("[가-힣]", "", s1); r1
#12-2[특수문자 삭제]
r2 <- gsub("[[:punct:]]", "", s1); r2
#12-3[한글과 특수문자 삭제]
r3 <- gsub("[[@,^,!,.]|[가-힣]]", "", s1); r3
#12-4[100을 백으로 변환]
r4 <- gsub("100", "백", s1); r4
