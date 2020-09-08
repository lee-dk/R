#문제1
View(iris)

#문제2
x <- c(1,2,3,4,5)
y <- c(2,4,6,8,10)
df1 <- data.frame(x, y)

#문제3
col1 <- c(1:5)
col2 <- letters[1:5]
col3 <- c(6:10)
df2 <- data.frame(col1,col2,col3)

#문제4
가격 <- c(1800,1500,3000)
판매량<- c(24,38,13)
df3 <- data.frame(가격, 판매량)
rownames(df3) <- c("사과","딸기","수박")
df3

#문제5
(mean(가격))
(mean(판매량))

#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- math + stat
df4$grade <- ifelse(score >= 150,"A",
                ifelse(score >= 100,"B",
                       ifelse(score >= 70,"C",
                              ifelse(score < 70, "D"))))
df4                    

#문제7
str(emp)

#문제8
emp[3:5,]
emp[seq(3,5),]

#문제9
emp[-4]

#문제10
emp["ename"]

#문제11
emp[,c("ename","sal")]

#문제12
emp[emp$job=="SALESMAN",c("ename","sal","job")]

#문제13
emp[emp$sal>=1000 & emp$sal<=3000, c("ename","sal","deptno")]

#문제14
emp[!emp$job=="ANALYST",]

#문제15
emp[emp$job=="ANALYST"|emp$job=="SALESMAN",c("ename","job")]

#문제16
emp[is.na(emp$comm),c("ename","sal")]

#문제17
emp[order(emp$sal),]


#문제18
dim(emp)
