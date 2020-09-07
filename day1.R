#R 공부를 열심히 하자

v1 <- 1:10
#1:10 - 1부터 10개 1씩 증가
v1 = 1:10
1:10 -> v1
#다 같은 뜻(대입연산자)
print(v1)
v1
#둘다 출력한다는 뜻
1:100
100:1

(v2 <- v1 + 100)
#괄호안에 문장을 수행하고 출력해준다

(v2 <- v1 + 100); v2

v3 <- v1 * 10; v3
ls()

v4 <- c(10, 5, 7, 4, 15, 1)
1 <- c(100, 200, 400, '사백')
# 벡터는 동일한 타입의 데이터만 구성되고 문자형이 더 커서 숫자들은 자동으로 형변환 됨.

seq(1, 10)      # 1부터 10까지(기본증가치 = 1)
seq(1, 10, 2)   # 1부터 10까지 2씩 증가
seq(0, 100, 5)  # 0부터 100 까지 5씩 증가



rep(1, 100) #반복 : 1을 100번 반복해라
rep(1:3, 5) #1,2,3으로 구성되는 벡터를 5번 반복
rep(1:3, times=5) # 키워드 파라미터
rep(1:3, each=5) # 각각 반복해라 1 5번, 2 5번, 3 5번
?rep  #help()

LETTERS #알파벳 대문자
letters #알파벳 소문자
month.name #영어로 월 이름
month.abb #월 이름 짧게
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
#첫번째 인자만; 3,4,5번째 인수만;
LETTERS[3:5]; LETTERS[5:3]
#3번째부터 5번째 까지; 5번째부터 3번째까지;
LETTERS[-1]; LETTERS[c(-2,-4)]
#1번째 빼고나머지; 두번째 네번째 빼고 나머지 출력

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x) #데이터타입 체크
rev(x) #거꾸로 출력
range(x) #범위를 구하는 함수(최소값, 최대값)
sort(x) #오름차순
sort(x, decreasing = TRUE) #내림차순
sort(x, decreasing = T)
x <- sort(x) #해주고 출력하면 작은 순서대로 정렬
order(x) #각 행에있는 인수가 몇번째로 큰지 알려줌(인덱스로 나열)

x[3] <- 20 #세번째 인수를 20으로 변경해라
x
x + 1
x <- x + 1
max(x);min(x);mean(x);sum(x)
#최대; 최소; 평균; 합;
summary(x) #요약

x[c(2,4)] # x[2], x[4]
x[c(F,T,F,T,F)] # x[c(T,F)] (T)
#x의 2번째 4번째 인수 출력
x > 5
#x에서 5보다 큰 수는 TRUE
x[x > 5] 
#x에서 5보다 큰 수만 출력
x[x > 5 & x < 15] # x[x > 5 && x < 15]
# x에서 5보다 크고 15보다 작은수출력, && : 첫번째 인수만 비교(조건에 맞지 않으면 FALSE)
#x[x > 5 | x < 15]
 # OR연산

names(x)
names(x) <- LETTERS[1:5] # 이름 지정 (알파벳)
names(x) <- NULL #이름 지정 삭제
x[2];x["B"]; #x[B()]


# &, &&
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


ls()
rm(x) #삭제
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100)
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)]
which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3)
#1부터 20사이에 난수 3개
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T) #중복 허용

paste("I'm","Duli","!!")
paste("I'm","Duli","!!", sep="") # 중간에 ""주기
paste0("I'm","Duli","!!") #중간에 공백을 주지마라

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")




# matrix 실습
x1 <-matrix(1:8, nrow = 2)
# 2행으로된 1부터 8까지의 인수를 갖는 행렬
x1
x1<-x1*3
# 모든 인수에 3을 곱한다
x1

sum(x1); min(x1);max(x1);mean(x1)

x2 <-matrix(1:8, nrow =3)
# 인수가 8개라 행이 3개짜리 는 만들수가 없음(3행은 3의 배수개 일때 가능) 
x2

(chars <- letters[1:10])

mat1 <-matrix(chars)
mat1; dim(mat1)
# 10행 1열
matrix(chars, nrow=1)
# 1행 10열 
matrix(chars, nrow=5)
# 5행 2열
matrix(chars, nrow=5, byrow=T)
# 5행 2열(순서대로)
matrix(chars, ncol=5)
# 자동으로 2행 5열
matrix(chars, ncol=5, byrow=T)
#우츶으로 순서대로 2행 5열
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)
#출력은 되지만 length가 3의 배수가 아니므로 warning

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1
#vec1,2,3 순서대로 행이 된다(행의 이름이 변수명이 된다)
mat2 <- cbind(vec1,vec2,vec3); mat2
#vec1,2,3 순서대로 열이 된다(열의 이름이 변수명이 된다)
mat1[1,1]
# mat1의 1행 1열의 값
mat1[2,];mat1[,3]
#mat1 -2행의 모든열; 3열의 모든 행(행에는 이름이 있으므로 이름도 같이 출력)
mat1[1,1,drop=F]
# matrix구조는 유지시키고 1행1열 출력
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL
#row의 이름을 null값(기본값)으로 변경
colnames(mat2) <- NULL
#col의 이름을 null값(기본값)으로 변경
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
#행의 이름 따로 열의 이름 따로 지정
mat1
ls() #Rstudio에서 기동되어지고 있는 R session안에 모든 것
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2)
#열단위로 summary해줌

mean(x2[2,])
sum(x2[2,])
# 행단위로 결과가 나옴
rowSums(x2); colSums(x2)
#행단위로 모든열의 합; 열단위로 모든행의 합

apply(x2, 1, sum); apply(x2, 2, sum)  
# x2의 행단위(1), 열단위(2)로 sum
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)  # 행단위로 최대, 최소, 편균값

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)  # 열단위로 최대, 최소, 편균값

#Array 실습
a1 <- array(1:30, dim=c(2,3,5))
#2행 3열 짜리의 행렬이 5개
a1

a1[1,3,4]
# 4층의 1행3열
a1[,,3]
# 3층의 모든 데이터
a1[,2,]
#모든 층에대하려 2열 데이터
a1[1,,]
#모든 층에 대하여 1행데이터
a1[,2,]

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score)

f_score <- factor(score)
class(f_score)
f_score
summary(f_score)
levels(f_score)

plot(score)
plot(f_score)


data1 <- c("월","수","토","월",
           "목","화")
data1
class(data1)
summary(data1)
day1 <- factor(data1)
day1
class(day1)
summary(day1)
levels(day1)

week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
day2 <- factor(data1, 
               levels=week.korabbname)
day2
summary(day2)
levels(day2)



btype <- factor(
  c("A", "O", "AB", "B", "O", "A"), 
  levels=c("A", "B", "O"))
btype
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성"))
gender
summary(gender)
levels(gender)