library() # 설치된 패키지 리스트
installed.packages() #이미 설치되어있는 패키지 리스트
search() #load된 패키지 리스트

read_excel() #내장 함수가 아니라 따로 설치해야함(R은 따로 내장하지 않음)
install.packages("readxl") #엑셀문서 읽음
install.packages("rvest") #수집에 필요한 패키지
install.packages("XML")
install.packages("httr")
install.packages("readr")


library(readxl) # require(readxl) 에러없이 실행되면 로드된거임
excel_data_ex <- read_excel("data/data_ex.xlsx")
View(excel_data_ex) #출력
search()
str(excel_data_ex) #향상된 데이터프레임(tibble)



# 정적 웹 크롤링과 스크래핑
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url) #끌어오는 함수
text

nodes <- html_nodes(text, "div")
nodes
title <- html_text(nodes)
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1, "style")

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)

