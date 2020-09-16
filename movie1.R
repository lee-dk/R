# 단일 페이지
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url<- "https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url) 
text
# 영화제목
nodes <- html_nodes(text, ".tit_rel")
title <- html_text(nodes)
title
#작성자
nodes <- html_nodes(text, ".link_review em")
name <- html_text(nodes)
name
# 영화평점
nodes <- html_nodes(text, ".raking_grade em")
point <- html_text(nodes)
point
# 영화리뷰 
nodes <- html_nodes(text, ".desc_review")
nodes <- html_text(nodes, trim=TRUE)
nodes
review <- nodes[nchar(nodes) > 0] 
review
page <- data.frame(title, name, point, review)
View(page)
write.csv(page, "daummovie1.csv")
