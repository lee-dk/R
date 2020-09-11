#문제8
iotest <- scan("data/iotest1.txt")
str(iotest)
View(iotest)

cat("오름차순 : ",iotest[order(iotest$X10.2.3.4.5),], sep="  ")
cat("내림차순 : ",iotest[order(-rank(iotest$X10.2.3.4.5)), ], sep="  ")
cat("합 : ",sum(iotest$X10.2.3.4.5), sep="  ")


#문제9
