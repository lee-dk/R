
# movie2
text<- NULL; newstitle<-NULL; newspapername<-NULL; ranking<-NULL
url<- "http://media.daum.net/ranking/popular/"
text <- read_html(url) 
text

# 헤드라인
for(n in 1:50){
  nodes <- html_nodes(text, "ul.list_news2 > li:nth-child(n) > div.cont_thumb > strong > a.link_txt")
  newstitle <- html_text(nodes)
}
newstitle
#신문사
nodes <- html_nodes(text, "div.cont_thumb > strong > span")
newspapername <- html_text(nodes)
newspapername

page <- data.frame(newstitle, newspapername)
View(page)
write.csv(page, "daumnews.csv")